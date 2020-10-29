require_relative '../models/user_with_token'

class ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
    # Get Authorization header Bearer token
    pattern = /^Bearer /
    header_value = request.headers['Authorization']
    if header_value && header_value.match(pattern)
      token = header_value.gsub(pattern, '')
      # Find user with unexpired token
      user = UserWithToken.where(["token = ? and tokenexp > ?", token, Date.today]).first!
    else
      render status: :unauthorized
    end
  rescue ActiveRecord::RecordNotFound
    render status: :unauthorized
  end
end
