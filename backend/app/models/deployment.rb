# frozen_string_literal: true

class Deployment < ApplicationRecord
  belongs_to :service
end
