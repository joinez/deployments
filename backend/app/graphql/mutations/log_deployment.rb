# frozen_string_literal: true

module Mutations
  class LogDeployment < Mutations::BaseMutation
    argument :status, String, required: true
    argument :service, String, required: true

    field :deployment, Types::DeploymentType, null: false
    field :errors, [String], null: false

    def resolve(status:, service:)
      case status
      when 'started'
        started = StartDeployment.call(service: service, status: status)

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
      when 'finished'
        finished = FinishDeployment.call(service: service, status: status)

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
      else
        {
          deployment: nil,
          errors: ['Deployment status not supported!']
        }
      end
    end
  end
end
