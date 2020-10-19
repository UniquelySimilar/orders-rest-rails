require_relative '../models/order'

class OrdersController < ApplicationController
  def index
    orders = Order.all
    render json: orders
  end

  def show
    order = Order.find(params[:id])
    render json: order
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'order id not found' }, status: :not_found
  end

  def find_by_customer
    orders = Order.where('customer_id = ?', params[:customer_id])
    render json: orders
  end

  def create
    Order.create(order_params)
    render status: :created
  rescue ActiveRecord::InvalidForeignKey
    render json: { error: 'foreign key customer id not found' }, status: :bad_request
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'order id not found' }, status: :not_found
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'order id not found' }, status: :not_found
  end

  def order_params
    params.permit(:customer_id, :order_status, :order_date, :required_date, :shipped_date)
  end
end