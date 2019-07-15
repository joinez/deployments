FactoryBot.define do
  factory :cloud do
    sequence :name do |n|
      "Cloud #{n}"
    end
  end
end
