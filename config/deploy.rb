set :application, "Karl Seguin's Blog"
set :repository,  "http://github.com/karlseguin/MyLittleBlog.git"

set :scm, :git
set :branch, 'master'

set :deploy_via, :remote_cache
set :deploy_to, "/srv/www/openmymind/"
set :user, "root"

role :web, "openmymind.net"
role :app, "openmymind.net"
role :db,  "openmymind.net", :primary => true

after 'deploy:update_code', 'deploy:updated_code'

namespace :deploy do
  task :updated_code do
    run "cp -R #{deploy_to}shared/public/* #{release_path}/public/"
    run "chown -R www-data:www-data #{release_path}"
    
    run "ln -nfs #{deploy_to}shared/config/config.yml #{release_path}/config/config.yml"
    run "cp #{deploy_to}shared/config/Gemfile #{release_path}/Gemfile"
    run "ln -nfs #{deploy_to}shared/config/initializers/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
  end
end

deploy.task :restart, :roles => :app do
  run "touch #{current_path}/tmp/restart.txt"
end