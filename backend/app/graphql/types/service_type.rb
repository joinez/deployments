# frozen_string_literal: true

module Types
  class ServiceType < Types::BaseObject
    graphql_name 'Service'

    field :id, ID, null: false
    field :name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :current_version, Types::CurrentVersionType, null: true
    field :current_versions, [Types::CurrentVersionType], null: true
  end
end
