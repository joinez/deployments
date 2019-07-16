# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :current_versions, dependent: :destroy
  has_many :deployments, through: :current_versions
  has_many :environments, through: :current_versions

  validates :name, presence: true
end
