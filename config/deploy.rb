    require 'mina/bundler'
    require 'mina/rails'
    require 'mina/git'
    require 'mina/rbenv'

    set :rails_env, 'production'

    set :domain,     'deploy@120.24.160.50'
    set :deploy_to,  "/home/deploy/app/#{rails_env}"
    set :app_path,   "#{deploy_to}/#{current_path}"
    set :repository, 'git@github.com:caiqinghua/aidai.git'
    #set :repository, 'https://github.com/caiqinghua/rails-mina-deploy.git'
    set :branch,     'master'


    task :environment do
      invoke :'rbenv:load'
    end

    task deploy: :environment do

      deploy do
        invoke :'git:clone'
        invoke :'bundle:install'
      end
    end
