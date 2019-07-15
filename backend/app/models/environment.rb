# frozen_string_literal: true

class Environment < ApplicationRecord
  belongs_to :cloud

  has_many :current_versions, dependent: :destroy
  has_many :deployments, dependent: :destroy
  has_many :services, through: :current_versions

  validates :name, presence: true
end
