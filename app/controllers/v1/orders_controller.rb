class V1::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request

  def index
    @orders = Order.all
    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  def show_user_orders
    @orders = Order.fetch_user_orders(params[:id])
    render json: @orders
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:owner_name, :owner_email, :owner_phone, :owner_address, :tbl_user_id, :tbl_payment_id, :ref_order_status_code)
    end
  end
