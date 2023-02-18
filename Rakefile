require "open3"

def execute(command)
  Open3.capture3(command)
end

desc "Jekyll Serve"
task :serve do
  # don't give a huge stacktrace when Control+C is used to stop server
  Thread.report_on_exception = false

  puts "Starting Jekyll in development mode with 127.0.0.1:4000 as the URL..."
  stdout, stderr, status = execute("bundle exec jekyll serve --config _config.yml,_config_development.yml --watch")
  if stderr
    puts stderr
    throw "There was an error!"
  else
    puts status
    puts stdout
    puts "All done!"
  end
end
