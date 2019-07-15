# frozen_string_literal: true

class Deployment < ApplicationRecord
  belongs_to :environment

  has_many :current_versions, dependent: :nullify
  has_many :services, through: :current_versions
end
