FactoryBot.define do
  factory :service do
    sequence :name do |n|
      "Test Application #{n}"
    end
  end
end
