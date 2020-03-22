# frozen_string_literal: true

class DeploymentVersion < ApplicationRecord
  belongs_to :deployment
  belongs_to :service

  validates :deployment, presence: true
  validates :service, presence: true
  validates :version, presence: true
end
