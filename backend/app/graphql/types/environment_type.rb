# frozen_string_literal: true

module Types
  class EnvironmentType < Types::BaseObject
    graphql_name 'Environment'

    field :id, ID, null: false
    field :name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :cloud, Types::CloudType, null: false
    # field :current_versions [Types::CurrentVersionType], null: true
    field :deployments, [Types::DeploymentType], null: true
    field :services, [Types::ServiceType], null: true
  end
end
