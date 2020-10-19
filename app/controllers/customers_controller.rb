require_relative '../models/customer'

class CustomersController < ApplicationController
  def index
    customers = Customer.all
    render json: customers
  end

  def show
    customer = Customer.find(params[:id])
    render json: customer
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'customer id not found' }, status: :not_found
  end

  def create
    customer = Customer.create(customer_params)
    render status: :created
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'customer id not found' }, status: :not_found
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'customer id not found' }, status: :not_found
  end

  def customer_params
    params.permit(:first_name, :last_name, :street, :city, :state, :zipcode, :home_phone, :work_phone, :email)
  end
end
