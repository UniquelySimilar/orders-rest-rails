require_relative '../models/user_with_token'

class ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
    # Get Authorization header Bearer token
    # Test token:
    pattern = /^Bearer /
    header_value = request.headers['Authorization']
    if header_value && header_value.match(pattern)
      token = header_value.gsub(pattern, '')
      logger.debug("Authorization header received with token: #{token}")
      # Find user with token
      if UserWithToken.find_by(token: token).nil?
        logger.debug("User NOT found with token: #{token}")
        render status: :unauthorized
      else
        # TODO: Check token expiration date
        logger.debug("User found with token: #{token}")
      end
    else
      logger.debug("Authorization header NOT received")
      render status: :unauthorized
    end
  end
end
