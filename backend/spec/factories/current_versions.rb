FactoryBot.define do
  factory :current_version do
    version { '0.1.0' }
    deployment
    environment
    service
  end
end
