# frozen_string_literal: true

module Types
  class ServiceType < Types::BaseObject
    graphql_name 'Service'

    field :id, ID, null: false
    field :name, String, null: false
  end
end
