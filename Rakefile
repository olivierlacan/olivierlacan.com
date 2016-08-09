def execute(command)
  system "#{command}"
end

desc 'Jekyll Serve'
task :serve do
  puts "Starting Jekyll in development mode with localhost:3000 as the URL..."
  execute("jekyll serve --config _config.yml,_config_development.yml")
end
