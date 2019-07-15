# frozen_string_literal: true

class CurrentVersion < ApplicationRecord
  belongs_to :environment
  belongs_to :deployment
  belongs_to :service

  validates :environment, presence: true
  validates :deployment, presence: true
  validates :service, presence: true
  validates :version, presence: true
end
