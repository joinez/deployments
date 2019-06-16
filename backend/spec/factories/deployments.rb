FactoryBot.define do
  factory :deployment do
    service
    started_at { rand(10..100).minutes.ago }
    finished_at { started_at + rand(1...10).minutes }
  end
end
