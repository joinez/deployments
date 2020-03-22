FactoryBot.define do
  factory :deployment_version do
    version { '0.1.0' }
    deployment
    service
  end
end
