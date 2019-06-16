cd backend
gem install bundler --conservative
bundle check || bundle
rails db:prepare
rails log:clear tmp:clear
rails restart
cd -
