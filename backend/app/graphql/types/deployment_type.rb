# frozen_string_literal: true

module Types
  class DeploymentType < Types::BaseObject
    graphql_name 'Deployment'

    field :id, ID, null: false
    field :build_url, String, null: true
    field :success, Boolean, null: true
    field :duration, Int, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :environment, Types::EnvironmentType, null: false
    field :deployment_versions, [Types::DeploymentVersionType], null: false
    field :services, [Types::ServiceType], null: false
  end
end
