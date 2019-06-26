set -e

# Setup backend
echo "\nSetting up backend.."
cd backend
gem install bundler -N -v "< 2"
bundle check 1>/dev/null || bundle
rails db:reset
echo "Cleaning log & tmp files"
rails log:clear tmp:clear
rails restart
cd - >/dev/null

# Setup frontend
echo "\nSetting up frontend.."
cd frontend
npm i
cd - >/dev/null
echo "Setup complete."
