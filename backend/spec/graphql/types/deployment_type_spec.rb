module Types
  RSpec.describe DeploymentType, type: :request do
    it 'query object' do
      deployment = create(:deployment)
      post '/graphql', params: { query: query_object(id: deployment.id) }

      json = JSON.parse(response.body)
      data = json['data']['deployment']

      expect(data).to include(
        'id' => be_present,
        'createdAt' => be_present,
        'updatedAt' => be_present,
        'success' => be_present,
        'duration' => be_present,
        'environment' => be_present,
        'currentVersions' => be_kind_of(Array),
        'services' => be_kind_of(Array)
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
        'createdAt' => be_present,
        'updatedAt' => be_present,
        'success' => be_present,
        'duration' => be_present,
        'environment' => be_present,
        'currentVersions' => be_kind_of(Array),
        'services' => be_kind_of(Array)
      )
    end

    def query_object(id:)
      <<~GQL
        {
          deployment(id: "#{id}") {
            id
            createdAt
            updatedAt
            success
            duration
            environment {
              id
            }
            currentVersions {
              id
            }
            services {
              id
            }
          }
        }
      GQL
    end

    def query_all
      <<~GQL
        {
          deployments {
            id
            createdAt
            updatedAt
            success
            duration
            environment {
              id
            }
            currentVersions {
              id
            }
            services {
              id
            }
          }
        }
      GQL
    end
  end
end
