# frozen_string_literal: true

class StartDeployments
  include Interactor

  def call
    service = Service.find_or_create_by(name: context.service)

    deployment = Deployment.find_or_create_by(service: service, build_id: context.build_id)

    if deployment.save
      context.deployment = deployment
    else
      context.fail!
    end
  end
end
