require_relative '../../lib/misc/testmessage'
require_relative '../models/customer'

class CustomersController < ApplicationController
  def index
    customers = Customer.all
    render json: customers
  end

  def show
    customer = Customer.find(params[:id])
    render json: customer
  end

  def create
    customer = Customer.create(customer_params)
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
  end

  def customer_params
    params.permit(:first_name, :last_name, :street, :city, :state, :zipcode, :home_phone, :work_phone, :email)
  end
end
