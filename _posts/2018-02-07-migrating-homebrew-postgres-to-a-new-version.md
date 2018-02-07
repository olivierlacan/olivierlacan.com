---
title: Migrating Homebrew Postgres to a New Version
layout: post
date: '2018-02-07 08:21:00'
location: Paris, France
categories:
  - open source software
---

This post was originally published as a [Gist][1] which I since forgot
about and accidentally rediscovered recently when the need arose to
resolve a similar accidental upgrade. I felt like it deserved to
live somewhere where there is a chance I might update it.

## Update

In Homebrew 1.5 and above, there's a new process to upgrade your
Postgres database across major versions using the
`brew postgresql-upgrade-database` command which was [added by Mike
McQuaid on January 8th, 2018][3].

This is a fantastic one-step improvement over the lengthy guide you'll
see below, but since this new command isn't foolproof (it will fail if
you haven't killed all processes connected to your database) it seems
like a good idea to still understand the way it works behind the scenes.

## Accidental Homebrew Upgrades

This guide assumes that you recently ran `brew upgrade postgresql` and
discovered to your dismay that you accidentally bumped from one major
version to another: say 9.3.x to 9.4.x. Yes, that is a major version
bump in PG land.

Some of the common signs of this issue are the following statements in
your logs:

```shell
FATAL:  database files are incompatible with server
DETAIL:  The data directory was initialized by PostgreSQL version 9.5, which is not compatible with this version 10.0.
```

```shell
PG::InternalError: ERROR:  incompatible library "/usr/local/lib/postgresql/dict_snowball.so": version mismatch
DETAIL:  Server is version 9.5, library is version 10.0.
```

No need to panic. Your data should be fine. While you've upgraded the Postgres
library, your existing databases have not been removed. They simply need to be
upgraded to run with the new library.

So first, let's check something.

```shell
brew info postgresql
```

The top of what gets printed as a result is the most important:

```shell
postgresql: stable 9.4.1 (bottled)
http://www.postgresql.org/
Conflicts with: postgres-xc
/usr/local/Cellar/postgresql/9.3.2 (2924 files, 39M)
  Poured from bottle
/usr/local/Cellar/postgresql/9.4.1 (2996 files, 40M) *
  Poured from bottle
```

The interesting bit is that there are two versions installed on my
systems. Homebrew thankfully installs the Postgres binaries in different
subfolders, which is very important to be able to migrate data from one
version to the other.

As you can see I have my old version installed in
`/usr/local/Cellar/postgresql/9.3.2`. The new version is in
`/usr/local/Cellar/postgresql/9.4.1`.

First ensure that you have the correct PG binaries running:

```shell
which psql
/usr/local/bin/psql

psql --version
psql (PostgreSQL) 9.4.1
```

This means that the `pg_upgrade` binary we'll be using is also the new
one. But let's not assume:

```shell
pg_upgrade --version
pg_upgrade (PostgreSQL) 9.4.1
```

Good good.

## Mise en place

The directory where your actual database data is stored is different
from the one where your PostgreSQL binaries are installed. Homebrew
installs the data directory in `/usr/local/var/postgres/` and doesn't
touch that data folder when you upgrade from one version to the next.
This is a good thing because if Homebrew tried to install a brand new
database (with `initdb`) it could squash all your existing data.

First I recommend moving your existing data to a directory with a
different name:

```shell
mv /usr/local/var/postgres/ /usr/local/var/postgres.9.3.backup/
```

Now that the old data directory has been "moved", you can safely create
a brand new clean database:

```
initdb /usr/local/var/postgres/
The files belonging to this database system will be owned by user "olivierlacan".
This user must also own the server process.

The database cluster will be initialized with locale "en_US.UTF-8".
The default database encoding has accordingly been set to "UTF8".
The default text search configuration will be set to "english".

Data page checksums are disabled.

creating directory /usr/local/var/postgres ... ok
creating subdirectories ... ok
selecting default max_connections ... 100
selecting default shared_buffers ... 128MB
selecting dynamic shared memory implementation ... posix
creating configuration files ... ok
creating template1 database in /usr/local/var/postgres/base/1 ... ok
initializing pg_authid ... ok
initializing dependencies ... ok
creating system views ... ok
loading system objects' descriptions ... ok
creating collations ... ok
creating conversions ... ok
creating dictionaries ... ok
setting privileges on built-in objects ... ok
creating information schema ... ok
loading PL/pgSQL server-side language ... ok
vacuuming database template1 ... ok
copying template1 to template0 ... ok
copying template1 to postgres ... ok
syncing data to disk ... ok

WARNING: enabling "trust" authentication for local connections
You can change this by editing pg_hba.conf or using the option -A, or
--auth-local and --auth-host, the next time you run initdb.

Success. You can now start the database server using:

    postgres -D /usr/local/var/postgres
or
    pg_ctl -D /usr/local/var/postgres -l logfile start
```

Your output will be slightly different. For one, the user won't be
`olivierlacan` but whatever your system user is. You can find that out
easily with `whoami`.

Interesting to note, but if you use PostgreSQL with Rails. This means
there will be no password on your development database, so you can skip
the `password` field in `database.yml` or leave it **completely* empty.

## pg_upgrade

First we have to make sure both database servers are not running when we
do the upgrade:

```shell
pg_ctl -D /usr/local/var/postgres stop -m fast
pg_ctl -D /usr/local/var/postgres.9.3.backup stop -m fast
```

If you get the following message it's possible that you have PG in
launchctl which may prevent you from stopping the server:

```shell
pg_ctl: server does not shut down
```

In that case let's remove PG from launchctl for now, you can add it back
later by following the instructions given on `brew info postgres`:

```shell
launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
rm ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

Then try stopping the server again:

```shell
pg_ctl -D /usr/local/var/postgres stop -m fast
```

This would be good news:

```shell
pg_ctl: PID file "/usr/local/var/postgres/postmaster.pid" does not exist
Is server running?
```

If you're using a recent version of Homebrew (as you should), then it's
likely you're using homebrew services instead of launchctl to manage
persistent processes like postgres. So use this instead:

```shell
brew services stop postgresql
```

While brew services should do the job of stopping postgres, it's not
guaranteed that you don't have a server process connected to postgres
and locking it's `pid` (process ID) file. It's always a good idea to
check for that file which may exist at
`/usr/local/var/postgres/postmaster.pid`. If it does, remove it with
`rm /usr/local/var/postgres/postmaster.pid` and you'll save yourself
some surprises later on.

## Upgrading

Assuming you're dealing with the same version numbers I'm dealing with
(you probably aren't, so change them when running this on your machine),
this is what the `pg_upgrade` command should look like when you run it:

```shell
$ pg_upgrade -b /usr/local/Cellar/postgresql/9.3.2/bin/ -B /usr/local/Cellar/postgresql/9.4.1/bin/ -d /usr/local/var/postgres.9.3.backup/ -D /usr/local/var/postgres
```

Lowercase flags (`-b` and `-d`) are for old `binary` and `data`
directories respectively. Their uppercase counterparts are for their new
equivalents.

You should see the following output immediately if the upgrade process
is starting:

```shell
Performing Consistency Checks
-----------------------------
Checking cluster versions                                   ok
Checking database user is a superuser                       ok
Checking for prepared transactions                          ok
Checking for reg* system OID user data types                ok
Checking for contrib/isn with bigint-passing mismatch       ok
Checking for invalid "line" user columns                    ok
Creating dump of global objects                             ok
Creating dump of database schemas
                                                            ok
Checking for presence of required libraries                 ok
Checking database user is a superuser                       ok
Checking for prepared transactions                          ok

If pg_upgrade fails after this point, you must re-initdb the
new cluster before continuing.

Performing Upgrade
------------------
Analyzing all rows in the new cluster                       ok
Freezing all rows on the new cluster                        ok
Deleting files from new pg_clog                             ok
Copying old pg_clog to new server                           ok
Setting next transaction ID and epoch for new cluster       ok
Deleting files from new pg_multixact/offsets                ok
Copying old pg_multixact/offsets to new server              ok
Deleting files from new pg_multixact/members                ok
Copying old pg_multixact/members to new server              ok
Setting next multixact ID and offset for new cluster        ok
Resetting WAL archives                                      ok
Setting frozenxid and minmxid counters in new cluster       ok
Restoring global objects in the new cluster                 ok
Adding support functions to new cluster                     ok
Restoring database schemas in the new cluster
                                                            ok
Creating newly-required TOAST tables                        ok
Removing support functions from new cluster                 ok
Copying user relation files
                                                            ok
Setting next OID for new cluster                            ok
Sync data directory to disk                                 ok
Creating script to analyze new cluster                      ok
Creating script to delete old cluster                       ok

Upgrade Complete
----------------
Optimizer statistics are not transferred by pg_upgrade so,
once you start the new server, consider running:
    analyze_new_cluster.sh

Running this script will delete the old cluster's data files:
    delete_old_cluster.sh
```

You're done!

## Restarting

You manually shut down PG during this upgrade so now it won't be running
unless you follow the (old) `brew info postgres` instructions:

```shell
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

With Homebrew Services, the operation is even simpler:

```shell
homebrew services start postgresql
```

Once PG is running you could run the optimization script recommended by
`pg_upgrade`. It was created in whichever directory you ran `pg_upgrade`
in, and you can run it with:

```shell
./analyze_new_cluster.sh
This script will generate minimal optimizer statistics rapidly
so your system is usable, and then gather statistics twice more
with increasing accuracy.  When it is done, your system will
have the default level of optimizer statistics.

If you have used ALTER TABLE to modify the statistics target for
any tables, you might want to remove them and restore them after
running this script because they will delay fast statistics generation.

If you would like default statistics as quickly as possible, cancel
this script and run:
    "/usr/local/Cellar/postgresql/9.4.1/bin/vacuumdb" --all --analyze-only

(...)
```

## Troubleshooting

You may encounter the following error:

```shell
*failure*
Consult the last few lines of "pg_upgrade_server.log" for
the probable cause of the failure.

There seems to be a postmaster servicing the new cluster.
Please shutdown that postmaster and try again.
Failure, exiting
```

This means you have at least one PG server running. So go back to the
beginning of this section and make real sure you shut down all your
servers.

You can also check this `pg_upgrade_server.log` file to be certain of
the issue. It should be located in
`/usr/local/var/log/pg_upgrade_server.log` but you can always use the
find command to locate it:

```shell
find / -name pg_upgrade_server.log
```

When using `brew postgresql-upgrade-database`, this log should contain
the reason the upgrade process failed as well as the actual command
used, which will be very useful for you to restart the upgrade process
manually.

I've found that running `brew postgresql-upgrade-database` again after
an initial failed attempt usually results in an error message saying
that the data was already upgraded when it's not actually true or at
least the process hasn't fully completed.

You can see how this script works by [checking its source code][2]. It
seems like it's comparing the installed (in Homebrew) version to the
version of the

[1]: https://gist.github.com/olivierlacan/e1bf5c34bc9f82e06bc0
[2]: https://github.com/Homebrew/homebrew-core/blob/ac2ba2b02772708fe648363e4ef9dad891d89ef6/cmd/brew-postgresql-upgrade-database.
[3]: https://github.com/Homebrew/homebrew-core/commit/25d5a9ef6cd3dbbd903aa87bd6f6fa423c13ee6e
