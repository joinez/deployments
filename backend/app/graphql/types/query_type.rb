# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Services
    field :services, [Types::ServiceType], null: false

    def services
      Service.all
    end

    field :service, Types::ServiceType, null: false do
      argument :id, ID, required: true
    end

    def service(id:)
      Service.find(id)
    end

    # Deployments
    field :deployments, [Types::DeploymentType], null: false

    def deployments
      Deployment.all
    end

    field :deployment, Types::DeploymentType, null: false do
      argument :id, ID, required: true
    end

    def deployment(id:)
      Deployment.find(id)
    end
  end
end
