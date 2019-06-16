# frozen_string_literal: true

class Deployment < ApplicationRecord
  belongs_to :service

  validates :service, presence: true
end
