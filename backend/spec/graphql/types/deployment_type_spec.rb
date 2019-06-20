module Types
  RSpec.describe DeploymentType, type: :request do
    it 'query object' do
      deployment = create(:deployment)
      post '/graphql', params: { query: query_object(id: deployment.id) }

      json = JSON.parse(response.body)
      data = json['data']['deployment']

      expect(data).to include(
        'id' => be_present,
        'startedAt' => be_present,
        'finishedAt' => be_present
      )
    end

    it 'query all' do
      create_list(:deployment, 2)
      post '/graphql', params: { query: query_all }

      json = JSON.parse(response.body)
      expect(json['data']['deployments'].size).to eq 2
      data = json['data']['deployments'][0]

      expect(data).to include(
        'id' => be_present,
        'startedAt' => be_present,
        'finishedAt' => be_present,
        'service' => be_present
      )
    end

    def query_object(id:)
      <<~GQL
        {
          deployment(id: "#{id}") {
            id
            startedAt
            finishedAt
          }
        }
      GQL
    end

    def query_all
      <<~GQL
        {
          deployments {
            id
            startedAt
            finishedAt
            service {
              id
              name
            }
          }
        }
      GQL
    end
  end
end
