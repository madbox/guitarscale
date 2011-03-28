$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.9.2'        # Or whatever env you want it to run in.
set :rvm_type, :user

set :application, "guitarscale"
set :repository,  "git@github.com:madbox/guitarscale.git"

app_path = "~/projects/guitarscale"

set :deploy_to, app_path
set :use_sudo, false

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "mad-box.ru"                          # Your HTTP server, Apache/etc
role :app, "mad-box.ru"                          # This may be the same as your `Web` server
role :db,  "mad-box.ru", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

task :prepare_configs, :roles => :app do
  db_config = File.join shared_path, "database.yml"
  run %Q{ cp #{ db_config } #{ File.join release_path, 'config', 'database.yml' } }
end

after "deploy:update_code", :prepare_configs

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do
    run "cd #{current_path}; bundle exec unicorn_rails -D"
  end
  task :stop do
    run "cd #{currnet_path}; kill -9 $(cat tmp/pids/unicorn.pid)"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path}; kill -9 $(cat tmp/pids/unicorn.pid); bundle exec unicorn_rails -D"
  end
end
