module Types
  RSpec.describe CurrentVersionType, type: :request do
    it 'query object' do
      current_version = create(:current_version)
      post '/graphql', params: { query: query_object(id: current_version.id) }

      json = JSON.parse(response.body)
      data = json['data']['currentVersion']

      expect(data).to include(
        'id' => be_present,
        'version' => be_present,
        'createdAt' => be_present,
        'updatedAt' => be_present,
        'environment' => be_present,
        'deployment' => be_present,
        'service' => be_present
      )
    end

    it 'query all' do
      create_list(:current_version, 2)
      post '/graphql', params: { query: query_all }

      json = JSON.parse(response.body)
      expect(json['data']['currentVersions'].size).to eq 2
      data = json['data']['currentVersions'][0]

      expect(data).to include(
        'id' => be_present,
        'version' => be_present,
        'createdAt' => be_present,
        'updatedAt' => be_present,
        'environment' => be_present,
        'deployment' => be_present,
        'service' => be_present
      )
    end

    def query_object(id:)
      <<~GQL
        {
          currentVersion(id: "#{id}") {
            id
            version
            createdAt
            updatedAt
            environment {
              id
            }
            deployment {
              id
            }
            service {
              id
            }
          }
        }
      GQL
    end

    def query_all
      <<~GQL
        {
          currentVersions {
            id
            version
            createdAt
            updatedAt
            environment {
              id
            }
            deployment {
              id
            }
            service {
              id
            }
          }
        }
      GQL
    end
  end
end
