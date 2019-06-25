s1 = Service.find_or_create_by(name: 'Auth Service')
s2 = Service.find_or_create_by(name: 'Application 1')
s3 = Service.find_or_create_by(name: 'Application 2')

Deployment.destroy_all

FactoryBot.create(:deployment, service: s1)
FactoryBot.create(:deployment, service: s1)
FactoryBot.create(:deployment, service: s2)
FactoryBot.create(:deployment, service: s3, finished_at: nil)

# rubocop:disable Rails/Output
puts "Seeded #{Service.count} services and #{Deployment.count} deployments."
# rubocop:enable Rails/Output
