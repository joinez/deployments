FactoryBot.define do
  factory :service do
    sequence :name do |n|
      "Service #{n}"
    end
  end
end
