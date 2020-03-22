c1 = Cloud.find_or_create_by(name: 'AWS')
c2 = Cloud.find_or_create_by(name: 'Azure')

e1 = Environment.find_or_create_by(name: 'staging', cloud: c1)
e2 = Environment.find_or_create_by(name: 'production', cloud: c2)

s1 = Service.find_or_create_by(name: 'Auth Service')
s2 = Service.find_or_create_by(name: 'Application 1')
s3 = Service.find_or_create_by(name: 'Application 2')

Deployment.destroy_all
d1 = FactoryBot.create(:deployment, environment: e1)
d2 = FactoryBot.create(:deployment, environment: e1)
d3 = FactoryBot.create(:deployment, environment: e2)

DeploymentVersion.destroy_all
FactoryBot.create(:deployment_version, service: s1, deployment: d1)
FactoryBot.create(:deployment_version, service: s2, deployment: d2)
FactoryBot.create(:deployment_version, service: s3, deployment: d3)

CurrentVersion.destroy_all
FactoryBot.create(:current_version, environment: e1, service: s1, deployment: d1)
FactoryBot.create(:current_version, environment: e1, service: s2, deployment: d2)
FactoryBot.create(:current_version, environment: e2, service: s3, deployment: d3)

# rubocop:disable Rails/Output
puts 'Seeded:'
puts "- #{Cloud.count} clouds #{Cloud.pluck(:name)}"
puts "- #{Environment.count} environments #{Environment.pluck(:name)}"
puts "- #{Service.count} services #{Service.pluck(:name)}"
puts "- #{Deployment.count} deployments"
puts "- #{CurrentVersion.count} current_versions"
# rubocop:enable Rails/Output
