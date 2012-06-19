
set :application, "face4.so"
set :repository,  "git@github.com:face4.so/face4.so.git"

set :scm, :git
set :scm_passphrase, ""
set :deploy_via, :remote_cache
set :use_sudo, false
default_run_options[:pty] = true
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
role :app, "118.144.94.147"
role :db, "118.144.94.147", :primary => true
set :deploy_to, "/var/www/face4.so"
require 'capistrano-unicorn'
require "bundler/capistrano"
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
#before "deploy:restart",":deploy:setup_symlink"
after "deploy:create_symlink","deploy:create_my_symlink"
after "unicorn:reload","deploy:start_jobs"

namespace :deploy do
  task :start do
  end
 
  task :start_jobs do
    run "cd #{current_path} && bundle install"
  end

  task :create_my_symlink do  

    #sql database
    run "ln -nfs #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"

    #Solr engine
    #run "ln -nfs #{shared_path}/solr/ #{release_path}/solr"
  end

end
