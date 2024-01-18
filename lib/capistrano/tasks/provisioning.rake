require 'aws-sdk-ec2'
require 'erb'
require 'open-uri'

PACKAGES = %w[
  git
  curl
  libssl-dev
  libreadline-dev
  zlib1g-dev
  autoconf
  bison
  build-essential
  libyaml-dev
  libreadline-dev
  libncurses5-dev
  libffi-dev
  libgdbm-dev
  libpq-dev
  dirmngr
  gnupg
  apt-transport-https
  ca-certificates
  imagemagick
  webp
  libnss3
  libxss1
  libasound2
  libatk-bridge2.0-0
  libgtk-3-0
  libgbm-dev
  libu2f-udev
  xdg-utils
  libvulkan1
  fonts-liberation
  zip
  pdftk
  libvips
  silversearcher-ag
].freeze

# perform in order
namespace :deploy do
  desc 'copy files to server'
  task :copy_files do
    `bin/rake assets:clobber`
    `bin/rake assets:precompile`
    # download html file from localhost
    index_page = URI.open('http://localhost:3000').read
    File.write('public/index.html', index_page)

    on roles(:setup) do
      upload!('public/index.html', '/home/ubuntu/index.html')
      # sudo cp /home/ubuntu/index.html /var/www/html/index.html
      execute 'sudo cp /home/ubuntu/index.html /var/www/html/index.html'

      # upload all files in public/assets to /home/ubuntu/assets
      upload!('public/assets', '/home/ubuntu/assets', recursive: true)
      # sudo cp -r /home/ubuntu/assets /var/www/html/assets
      execute 'sudo cp -r /home/ubuntu/assets /var/www/html/assets'

      # restart nginx
      execute 'sudo service nginx restart'
    end
  end

  desc 'Setup package dependencies'
  task :provision_packages do
    on roles(:setup) do
      execute 'sudo apt-get update'
      execute "sudo apt-get -y install #{PACKAGES.join(' ')}"
      execute 'sudo apt install curl -y'
    end
  end

  desc 'Setup Nginx'
  task :provision_nginx do
    on roles(:setup) do
      execute 'sudo apt-get install -y nginx'
      execute 'sudo systemctl start nginx'
      execute 'sudo systemctl enable nginx'
      # restart nginx
      execute 'sudo service nginx restart'
    end
  end
end
