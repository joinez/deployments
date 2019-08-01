FactoryBot.define do
  factory :deployment do
    sequence :build_url do |n|
      "http://example.com/build/#{n}"
    end
    success { true }
    duration { rand(30..240) }
    environment
  end
end
