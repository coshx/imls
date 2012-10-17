require 'bundler/capistrano'
require 'capistrano_colors'

load 'deploy/assets'

set :application, "imls"
set :repository,  "git@github.com:coshx/imls.git"
set :branch, fetch(:branch, "master")
set :deploy_to, "/opt/imls"
set :keep_releases, 3
set :scm, :git
set :user, :imls

default_run_options[:pty]   = true
default_run_options[:shell] = "/bin/bash -l"

ssh_options[:forward_agent] = true

set :deploy_via, :remote_cache

role :web, "your web-server here"
role :app, "your app-server here"                          # This may be the same as your `Web` server
role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
