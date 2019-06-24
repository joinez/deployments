# frozen_string_literal: true

module Mutations
  class FinishDeployment < Mutations::BaseMutation
    argument :build_id, String, required: true
    argument :service, String, required: true

    field :deployment, Types::DeploymentType, null: false
    field :errors, [String], null: false

    def resolve(service:, build_id:)
      finished = FinishDeployments.call(service: service, build_id: build_id)

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
