module Types
  RSpec.describe CloudType, type: :request do
    it 'query object' do
      cloud = create(:cloud)
      post '/graphql', params: { query: query_object(id: cloud.id) }

      json = JSON.parse(response.body)
      data = json['data']['cloud']

      expect(data).to include(
        'id' => be_present,
        'name' => be_present,
        'createdAt' => be_present,
        'updatedAt' => be_present,
        'environments' => be_kind_of(Array)
      )
    end

    it 'query all' do
      create_list(:cloud, 2)
      post '/graphql', params: { query: query_all }

      json = JSON.parse(response.body)
      expect(json['data']['clouds'].size).to eq 2
      data = json['data']['clouds'][0]

      expect(data).to include(
        'id' => be_present,
        'name' => be_present,
        'createdAt' => be_present,
        'updatedAt' => be_present,
        'environments' => be_kind_of(Array)
      )
    end

    def query_object(id:)
      <<~GQL
        {
          cloud(id: "#{id}") {
            id
            name
            createdAt
            updatedAt
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
          clouds {
            id
            name
            createdAt
            updatedAt
            environments {
              id
            }
          }
        }
      GQL
    end
  end
end
