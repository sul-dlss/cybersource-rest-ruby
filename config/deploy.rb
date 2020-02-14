# frozen_string_literal: true

set :application, 'cybersource-rest-ruby'
set :repo_url, 'https://github.com/sul-dlss/cybersource-rest-ruby.git'
set :user, 'sirsi'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default value for :log_level is :debug
set :log_level, :info

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/s/SUL/Bin/CyberSource/#{fetch(:application)}"

# Default value for linked_dirs is []
set :linked_dirs, ['config/settings']

# Default value for keep_releases is 5
set :keep_releases, 3

set :default_env, { path: '/s/sirsi/.rvm/gems/ruby-2.6.3/bin:/s/sirsi/.rvm/gems/ruby-2.6.3@global/bin:/s/sirsi/.rvm/rubies/ruby-2.6.3/bin:/s/sirsi/.rvm/bin:.:/bin:/usr/bin:/etc:/usr/sbin' }
