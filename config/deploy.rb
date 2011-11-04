#
# bundler
#
require 'bundler/capistrano'

#
# app/server config
#
set :application, "depot"
set :user, "katya"

set :deploy_to, "/var/www/depot"
set :deploy_via, :remote_cache

#set :use_sudo, false
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

#
#  GIT
#
set :scm, :git
set :gituser, "katyabain"
set :repository,  "git@github.com/#{gituser}/depot.git"
set :branch, "master"
set :copy_exclude, [".git", "spec"]

#
#   RVM
#
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, 'ruby-1.9.2-head@rails_app'

#
# UNICORN
#
set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

#
#  Cap deploy config
#
server "superfranklin.com", :app, :web, :db, :primary => true
set :rails_env, :production



#set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

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
