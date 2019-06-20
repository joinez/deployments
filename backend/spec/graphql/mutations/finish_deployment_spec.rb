module Mutations
  RSpec.describe FinishDeployment, type: :request do
    let(:service) { build(:service) }

    it 'finish existing deployment' do
      deployment = create(:deployment, service: service, finished_at: nil)
      expect do
        post '/graphql', params: { query: query(service: service.name) }
      end.to change { deployment.reload.finished_at }.from(nil)
    end

    def query(service:)
      <<~GQL
        mutation {
          finishDeployment(
            input: { service: "#{service}" }
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
