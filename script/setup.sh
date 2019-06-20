cd backend
gem install bundler --conservative
bundle check || bundle
rails db:prepare db:seed
rails log:clear tmp:clear
rails restart
cd -
