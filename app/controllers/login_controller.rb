require_relative '../models/user_with_token'

class LoginController < ApplicationController
  def login
    user = UserWithToken.where(username: params[:username], password: params[:password]).first!
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'user not found' }, status: :not_found
  end

  def logout
  end
end
