module Mutations
  RSpec.describe CreateDeployment, type: :request do
    let(:cloud) { build(:cloud) }
    let(:environment) { build(:environment) }
    let(:service1) { build(:service) }
    let(:service2) { build(:service) }

    it 'create new deployment' do
      expect do
        post '/graphql', params: { query: query }
      end.to change {
        [
          Cloud.count,
          Deployment.count,
          Environment.count,
          Service.count,
          CurrentVersion.count
        ]
      }.from([0, 0, 0, 0, 0]).to([1, 1, 1, 2, 2])
    end

    def query
      <<~GQL
        mutation {
          createDeployment(
            input: {
              cloud: "#{cloud.name}"
              environment: "#{environment.name}"
              buildUrl: "example.com/build/4"
              success: true
              duration: 60
              serviceVersions: [
                { service: "#{service1.name}", version: "0.1.0" }
                { service: "#{service2.name}", version: "1.0.2" }
              ]
            }
          ) {
            deployment {
              id
            }
          }
        }
      GQL
    end
  end
end
