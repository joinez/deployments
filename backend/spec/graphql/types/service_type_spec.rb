module Types
  RSpec.describe ServiceType, type: :request do
    it 'query object' do
      service = create(:service)
      post '/graphql', params: { query: query_object(id: service.id) }

      json = JSON.parse(response.body)
      data = json['data']['service']

      expect(data).to include(
        'id' => be_present,
        'name' => be_present,
        'createdAt' => be_present,
        'updatedAt' => be_present,
        'currentVersions' => be_kind_of(Array),
        'deployments' => be_kind_of(Array),
        'environments' => be_kind_of(Array)
      )
    end

    it 'query all' do
      create_list(:service, 2)
      post '/graphql', params: { query: query_all }

      json = JSON.parse(response.body)
      expect(json['data']['services'].size).to eq 2
      data = json['data']['services'][0]

      expect(data).to include(
        'id' => be_present,
        'name' => be_present,
        'createdAt' => be_present,
        'updatedAt' => be_present,
        'currentVersions' => be_kind_of(Array),
        'deployments' => be_kind_of(Array),
        'environments' => be_kind_of(Array)
      )
    end

    def query_object(id:)
      <<~GQL
        {
          service(id: "#{id}") {
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
            environments {
              id
            }
          }
        }
      GQL
    end

    def query_all
      <<~GQL
        {
          services {
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
            environments {
              id
            }
          }
        }
      GQL
    end
  end
end
