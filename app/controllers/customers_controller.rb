require_relative '../../lib/misc/testmessage'

class CustomersController < ApplicationController
  def index
    @message = TestMessage.new('test message')
    render json: @message
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
