# frozen_string_literal: true

module Mutations
  class FinishDeployment < Mutations::BaseMutation
    argument :service, String, required: true

    field :deployment, Types::DeploymentType, null: false
    field :errors, [String], null: false

    def resolve(service:)
      finished = FinishDeployments.call(service: service)

      if finished.success?
        {
          deployment: finished.deployment,
          errors: []
        }
      else
        {
          deployment: finished.deployment,
          errors: finished.deployment.errors.full_messages
        }
      end
    end
  end
end
