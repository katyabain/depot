# good example http://hostingrails.com/Capistrano-Deploying-Your-Rails-Application-on-HostingRails-com

 set :application, "depot"
 set :repository,  "git@github.com:katyabain/depot.git"
#
 set :scm, :git
 set :scm_username, "katyabain"
 set :user, "katya"
 set :branch, "master"
 #set :use_sudo, false
 set :copy_exclude, [".git", "spec"]
 set :deploy_via, :copy

 # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
 default_run_options[:pty] = true

 set :deploy_to, "/var/www/depot"
 # read more about it
 #set :chmod755, %w(app config db lib public vendor script tmp public/dispatch.cgi public/dispatch.fcgi public/dispatch.rb)

 role :web, "superfranklin.com"                          # Your HTTP server, Apache/etc
 role :app, "superfranklin.com"                          # This may be the same as your `Web` server
 role :db,  "superfranklin.com", :primary => true # This is where Rails migrations will run
 # role :db,  "your slave db-server here"

after "deploy", "deploy:cleanup"

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
