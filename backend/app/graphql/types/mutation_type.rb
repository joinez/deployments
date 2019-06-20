# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :start_deployment, mutation: Mutations::StartDeployment
    field :finish_deployment, mutation: Mutations::FinishDeployment
  end
end
