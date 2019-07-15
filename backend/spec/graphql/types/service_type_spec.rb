module Types
  RSpec.describe ServiceType, type: :request do
    xit 'query object' do
      service = create(:service)
      post '/graphql', params: { query: query_object(id: service.id) }

      json = JSON.parse(response.body)
      data = json['data']['service']

      expect(data).to include(
        'id' => be_present,
        'name' => be_present
      )
    end

    xit 'query all' do
      create_list(:service, 2)
      post '/graphql', params: { query: query_all }

      json = JSON.parse(response.body)
      expect(json['data']['services'].size).to eq 2
      data = json['data']['services'][0]

      expect(data).to include(
        'id' => be_present,
        'name' => be_present
      )
    end

    def query_object(id:)
      <<~GQL
        {
          service(id: "#{id}") {
            id
            name
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
          }
        }
      GQL
    end
  end
end
