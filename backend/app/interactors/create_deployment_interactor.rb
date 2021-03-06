# frozen_string_literal: true

class CreateDeploymentInteractor
  include Interactor

  def call # rubocop:disable Metrics/AbcSize
    cloud = Cloud.find_or_create_by(name: context.cloud)
    environment = Environment.find_or_create_by(
      name: context.environment,
      cloud: cloud
    )

    deployment = Deployment.new(
      environment: environment,
      build_url: context.build_url,
      success: context.success,
      duration: context.duration
    )

    context.service_versions.each do |service_version|
      service = Service.find_or_create_by(name: service_version.to_h[:service])
      DeploymentVersion.create(
        deployment: deployment,
        service: service,
        version: service_version.to_h[:version]
      )
      current_version = CurrentVersion.find_or_create_by(
        environment: environment,
        service: service
      )
      current_version.version = service_version.to_h[:version]
      current_version.deployment = deployment
      current_version.save
    end

    if deployment.save
      context.deployment = deployment
    else
      context.fail!
    end
  end
end
