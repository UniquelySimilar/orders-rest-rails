require_relative '../models/user_with_token'

class LoginController < ApplicationController
  skip_before_action :authenticate
  
  def login
    # Create test user with encrypted password
    #user = UserWithToken.new(username: 'tim', password: '')
    #user.save!

    user = UserWithToken.find_by(username: params[:username]).try(:authenticate, params[:password])
    if (!user)
      render status: :unauthorized
    else
      # Create, store, and return token
      token = SecureRandom.uuid
      user.update(token: token, tokenexp: Date::tomorrow())
      render json: { token: token }
    end
  end

  def logout
    # Get Authorization header Bearer token
    pattern = /^Bearer /
    header_value = request.headers['Authorization']
    if header_value && header_value.match(pattern)
      token = header_value.gsub(pattern, '')
      # Find user with unexpired token
      user = UserWithToken.find_by_token!(token)
      user.update(token: nil, tokenexp: nil)
    else
      # Since user just trying to log out, don't care if no Authorization header
      render status: :no_content
    end
  rescue ActiveRecord::RecordNotFound
    # Since user just trying to log out, don't care if token not found
    render status: :no_content
  end
end
