#Note: Make sure server installed the g++ compiler
load 'deploy'
load 'deploy/assets'
set :application, "face4.so"
set :repository,  "https://github.com/face4ad/face4.so.git"

set :scm, :git
set :scm_passphrase, ""
set :deploy_via, :remote_cache
set :use_sudo, false
default_run_options[:pty] = true

role :app, "118.144.94.147"
role :db, "118.144.94.147", :primary => true
role :web, "118.144.94.147"
set :deploy_to, "/var/www/face4.so"

require 'capistrano-unicorn'
require "bundler/capistrano"

# deploy:setup Install the ruby and rvm, if use deploy not deploy:setup, it would pre-install by every time of deployment
set :rvm_ruby_string, '1.9.3@rails32'
set :rvm_install_type, :stable
set :rvm_type, :user
require "rvm/capistrano"  #Make sure you add 'rvm-capistrano' and 'capistrano-unicorn' to your Gemfile, otherwise, it would raise error during cap deploy

before 'deploy:setup', 'rvm:install_rvm'
before 'deploy:setup', 'rvm:install_ruby'
after "deploy", "rvm:trust_rvmrc"
after "unicorn:reload","deploy:start_jobs"

namespace :deploy do
  task :start do
  end
 
  task :start_jobs do
  end
end

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end
