# frozen_string_literal: true

class Deployment < ApplicationRecord
  belongs_to :service

  validates :build_id, :service, presence: true

  after_initialize do |deployment|
    deployment.started_at = Time.zone.now
  end
end
