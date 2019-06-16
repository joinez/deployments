# frozen_string_literal: true

class BackendSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
