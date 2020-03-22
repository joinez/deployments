# frozen_string_literal: true

class Deployment < ApplicationRecord
  belongs_to :environment

  has_many :deployment_versions, dependent: :destroy
  has_many :services, through: :deployment_versions
end
