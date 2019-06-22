# frozen_string_literal: true

class FrontendController < ActionController::API
  def redirect
    redirect_to ENV.fetch('FRONTEND_URL', 'http://localhost:8080')
  end
end
