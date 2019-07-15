# frozen_string_literal: true

module Types
  class CurrentVersionType < Types::BaseObject
    graphql_name 'CurrentVersion'

    field :id, ID, null: false
    field :version, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :environment, Types::EnvironmentType, null: false
    field :service, Types::ServiceType, null: false
  end
end
