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

set :unicorn_conf, "#{shared_path}/unicorn.conf.rb"
set :unicorn_pid, "#{shared_path}/pids/unicorn.pid"
set :start_cmd, "`cd #{current_path} && bundle exec unicorn_rails -Dc #{unicorn_conf}`"
# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run "#{start_cmd}"
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -HUP `cat #{unicorn_pid}` || #{start_cmd}"
  end
end
