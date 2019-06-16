cd backend
gem install bundler --conservative
bundle install --with development test --without production --jobs 4 --no-cache --retry 3
RAILS_ENV=test rails db:create db:migrate
rails log:clear tmp:clear
cd -
