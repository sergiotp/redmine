set :user, "deployer"
set :application, "redmine-2.1"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:sergiotp/#{application}.git"
set :branch, "master"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "198.101.205.100", :web, :app, :db, primary: true

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", "deploy:after_update_code"

namespace :deploy do
  task :after_update_code  do
    run "cp #{shared_path}/database.yml #{release_path}/config/database.yml"
    #run "cd #{release_path} && bundle install --binstubs"
    #run "cd #{release_path} && bundle exec rake assets:precompile"
  end
end
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