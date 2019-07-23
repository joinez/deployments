# frozen_string_literal: true

module Types
  class ServiceVersion < Types::BaseInputObject
    description 'Attributes for service and version pairs of a deployment'
    argument :service, String, required: true
    argument :version, String, required: true
  end
end

module Mutations
  class CreateDeployment < Mutations::BaseMutation
    argument :cloud, String, required: true
    argument :environment, String, required: true
    argument :service_versions, [Types::ServiceVersion], required: true
    argument :build_url, String, required: true
    argument :success, Boolean, required: true
    argument :duration, Int, required: true

    field :deployment, Types::DeploymentType, null: false
    field :errors, [String], null: false

    def resolve(cloud:, environment:, service_versions:, build_url:, success:, duration:)
      d = CreateDeploymentInteractor.call(
        cloud: cloud,
        environment: environment,
        service_versions: service_versions,
        build_url: build_url,
        success: success,
        duration: duration
      )

      if d.success?
        {
          deployment: d.deployment,
          errors: []
        }
      else
        {
          deployment: nil,
          errors: d.deployment.errors.full_messages
        }
      end
    end
  end
end
