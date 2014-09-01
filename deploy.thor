require 'html/proofer'

class Deploy < Thor
  include Thor::Actions

  desc "github", "deploy to GitHub Pages"
  def github
    original_path = Dir.pwd
    deploy_path = "/Users/olivierlacan/Development/perso/olivierlacan.github.com"
    puts "Running Jekyll build --destination #{deploy_path}"
    run "jekyll build --destination #{deploy_path}"

    puts "Committing all changes"
    run "cd #{deploy_path} && git add -A . && git commit -m 'Run jekyll build at #{Time.now}'"
    puts "Deploying to GitHub"
    run "cd #{deploy_path} && git push -f origin master"

    puts "Donezies!"
  end

  desc "thor", "proof HTML"
  def proofer
    ::HTML::Proofer.new("./_site").run
  end
end
