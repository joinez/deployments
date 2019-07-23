# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_deployment, mutation: Mutations::CreateDeployment
  end
end
