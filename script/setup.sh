cd backend
gem install bundler -N -v "< 2"
bundle check || bundle
rails db:setup
rails log:clear tmp:clear
rails restart
cd -
