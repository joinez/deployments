# frozen_string_literal: true

module Types
  class DeploymentVersionType < Types::BaseObject
    graphql_name 'DeploymentVersion'

    field :id, ID, null: false
    field :version, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :deployment, Types::DeploymentType, null: false
    field :service, Types::ServiceType, null: false
  end
end
