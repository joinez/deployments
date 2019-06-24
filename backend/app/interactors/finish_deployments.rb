# frozen_string_literal: true

class FinishDeployments
  include Interactor

  def call
    service = Service.find_or_create_by(name: context.service)

    deployment = Deployment.where(service: service, build_id: context.build_id).last

    if deployment.update(finished_at: Time.zone.now)
      context.deployment = deployment
    else
      context.fail!
    end
  end
end
