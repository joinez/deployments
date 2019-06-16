# frozen_string_literal: true

module Types
  class DeploymentType < Types::BaseObject
    graphql_name 'Deployment'

    field :id, ID, null: false
    field :startedAt, GraphQL::Types::ISO8601DateTime, null: false
    field :finishedAt, GraphQL::Types::ISO8601DateTime, null: true

    field :service, Types::ServiceType, null: false
  end
end
