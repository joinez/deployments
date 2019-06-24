# frozen_string_literal: true

module Mutations
  class StartDeployment < Mutations::BaseMutation
    argument :build_id, String, required: true
    argument :service, String, required: true

    field :deployment, Types::DeploymentType, null: false
    field :errors, [String], null: false

    def resolve(service:, build_id:)
      started = StartDeployments.call(service: service, build_id: build_id)

      if started.success?
        {
          deployment: started.deployment,
          errors: []
        }
      else
        {
          deployment: nil,
          errors: started.deployment.errors.full_messages
        }
      end
    end
  end
end
