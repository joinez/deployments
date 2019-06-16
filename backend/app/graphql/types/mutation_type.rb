# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :log_deployment, mutation: Mutations::LogDeployment
  end
end
