# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Clouds
    field :clouds, [Types::CloudType], null: false

    def clouds
      Cloud.all
    end

    field :cloud, Types::CloudType, null: false do
      argument :id, ID, required: true
    end

    def cloud(id:)
      Cloud.find(id)
    end

    # Environments
    field :environments, [Types::EnvironmentType], null: false

    def environments
      Environment.all
    end

    field :environment, Types::EnvironmentType, null: false do
      argument :id, ID, required: true
    end

    def environment(id:)
      Environment.find(id)
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

    # CurrentVersions
    field :current_versions, [Types::CurrentVersionType], null: false

    def current_versions
      CurrentVersion.all
    end

    field :current_version, Types::CurrentVersionType, null: false do
      argument :id, ID, required: true
    end

    def current_version(id:)
      CurrentVersion.find(id)
    end
  end
end
