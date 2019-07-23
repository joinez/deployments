module Types
  RSpec.describe EnvironmentType, type: :request do
    it 'query object' do
      environment = create(:environment)
      post '/graphql', params: { query: query_object(id: environment.id) }

      json = JSON.parse(response.body)
      data = json['data']['environment']

      expect(data).to include(
        'id' => be_present,
        'name' => be_present,
        'createdAt' => be_present,
        'updatedAt' => be_present,
        'currentVersions' => be_kind_of(Array),
        'deployments' => be_kind_of(Array),
        'services' => be_kind_of(Array)
      )
    end

    it 'query all' do
      create_list(:environment, 2)
      post '/graphql', params: { query: query_all }

      json = JSON.parse(response.body)
      expect(json['data']['environments'].size).to eq 2
      data = json['data']['environments'][0]

      expect(data).to include(
        'id' => be_present,
        'name' => be_present,
        'createdAt' => be_present,
        'updatedAt' => be_present,
        'currentVersions' => be_kind_of(Array),
        'deployments' => be_kind_of(Array),
        'services' => be_kind_of(Array)
      )
    end

    def query_object(id:)
      <<~GQL
        {
          environment(id: "#{id}") {
            id
            name
            createdAt
            updatedAt
            currentVersions {
              id
            }
            deployments {
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
          environments {
            id
            name
            createdAt
            updatedAt
            currentVersions {
              id
            }
            deployments {
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
