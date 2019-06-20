# frozen_string_literal: true

class StartDeployment
  include Interactor

  def call
    service = Service.find_or_create_by(name: context.service)

    deployment = Deployment.new(service: service, started_at: Time.zone.now)

    if deployment.save
      context.deployment = deployment
    else
      context.fail!
    end
  end
end
