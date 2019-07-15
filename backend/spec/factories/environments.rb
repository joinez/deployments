FactoryBot.define do
  factory :environment do
    sequence :name do |n|
      "Environment #{n}"
    end
    cloud
  end
end
