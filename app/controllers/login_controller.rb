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
  end
end
