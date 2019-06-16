# frozen_string_literal: true

module Mutations
  class LogDeployment < Mutations::BaseMutation
    argument :status, String, required: true
    argument :service, String, required: true

    field :deployment, Types::DeploymentType, null: false
    field :errors, [String], null: false

    def resolve(status:, service:)
      service = Service.find_or_create_by(name: service)
      if status == 'started'
        deployment = Deployment.new(service: service, started_at: Time.zone.now)
        if deployment.save
          {
            deployment: deployment,
            errors: []
          }
        else
          {
            deployment: nil,
            errors: deployment.errors.full_messages
          }
        end
      elsif status == 'finished'
        deployment = Deployment.where(service: service).last
        if deployment.update(finished_at: Time.zone.now)
          {
            deployment: deployment,
            errors: []
          }
        else
          {
            deployment: deployment,
            errors: deployment.errors.full_messages
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
