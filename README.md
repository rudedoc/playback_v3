# README

Stupid deploy process

bin/rake assets:clobber

bin/rake assets:precompile

bin/rails s (only this not bin/dev)

rm public/index.html (so new one gets generated)

cap production deploy:copy_files
