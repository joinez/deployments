module Mutations
  RSpec.describe StartDeployment, type: :request do
    let(:service) { build(:service) }

    xit 'log new deployment' do
      expect do
        post '/graphql', params: { query: query(service: service.name) }
      end.to change { Deployment.count }.by(1)
    end

    def query(service:)
      <<~GQL
        mutation {
          startDeployment(
            input: { service: "#{service}", buildId: "1" }
          ) {
            deployment {
              id
              startedAt
              finishedAt
            }
          }
        }
      GQL
    end
  end
end
