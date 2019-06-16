# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :deployments, dependent: :destroy
end
