require "open3"

def execute(command)
  # Old way didn't allow for standard out streaming
  # Open3.capture3(command)

  # New way does (^_^)
  Open3.popen2e(command) do |stdin, stdout_stderr, wait_thread|
    Thread.new { stdout_stderr.each { puts _1 } }
    stdin.puts command
    wait_thread.value
  rescue Interrupt
    puts "\nInterrupt requested, closing server..."
    stdin.close
  end
end

desc "Jekyll Serve"
task :serve do
  # don't give a huge stacktrace when Control+C is used to stop server
  Thread.report_on_exception = false

  puts "Starting Jekyll in development mode with 127.0.0.1:4000 as the URL..."
  execute("bundle exec jekyll serve --config _config.yml,_config_development.yml --watch")
end

desc "Proof HTML"
task :proof do
  require 'html-proofer'
  HTMLProofer.check_directory("./_site").run
end