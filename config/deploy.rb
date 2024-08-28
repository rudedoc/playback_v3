# config valid for current version and patch releases of Capistrano
lock '~> 3.19.1'

set :application, 'playback_v3'
set :repo_url, 'git@github.com:rudedoc/playback_v3.git'
set :branch, 'main'

set :ssh_options, keys: ['lightsail.pem'], user: 'ubuntu'
