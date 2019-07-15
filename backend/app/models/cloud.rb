# frozen_string_literal: true

class Cloud < ApplicationRecord
  has_many :environments, dependent: :destroy

  validates :name, presence: true
end
