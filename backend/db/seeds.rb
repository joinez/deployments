s1 = Service.find_or_create_by(name: 'Auth Service')
s2 = Service.find_or_create_by(name: 'Application 1')
s3 = Service.find_or_create_by(name: 'Application 2')

Deployment.destroy_all

Deployment.create(service: s1, started_at: 30.minutes.ago, finished_at: 27.minutes.ago)
Deployment.create(service: s1, started_at: 14.minutes.ago, finished_at: 12.minutes.ago)
Deployment.create(service: s2, started_at: 49.minutes.ago, finished_at: 40.minutes.ago)
Deployment.create(service: s3, started_at: 3.minutes.ago)

# rubocop:disable Rails/Output
puts "Seeded #{Service.count} services and #{Deployment.count} deployments."
# rubocop:enable Rails/Output
