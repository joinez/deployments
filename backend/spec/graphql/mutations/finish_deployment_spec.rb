module Mutations
  RSpec.describe FinishDeployment, type: :request do
    let(:service) { build(:service) }

    it 'finish existing deployment' do
      deployment = create(:deployment, service: service, finished_at: nil)
      expect do
        post '/graphql', params: { query: query(service: service.name, build_id: deployment.build_id) }
      end.to change { deployment.reload.finished_at }.from(nil)
    end

    def query(service:, build_id:)
      <<~GQL
        mutation {
          finishDeployment(
            input: { service: "#{service}", buildId: "#{build_id}" }
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
