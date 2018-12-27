class V1::OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request

  def index
    @order_item_items = OrderItem.all
    render json: @order_item_items
  end

  # GET /order_item_items/1
  def show
    render json: @order_item
  end

  # DELETE /order_item_items/1
  def destroy
    @order_item.destroy
  end

  def fetch_order_items
    @order_items = OrderItem.fetch_items_in_order(params[:id])
    @list_order_items_ids  = @order_items.pluck :tbl_product_id
    @list_product_name = []

    @list_order_items_ids.each do |n|
      product_name = Product.where(id: n).first[:name]
      @list_product_name.push(product_name)
    end
    @list_order_items = []
    render json: {
      order_item: @order_items,
      product_name: @list_product_name
    }
  end

  def add_items_to_order
    @list_items_ids = params[:list_items]
    @list_quantity = params[:list_quantity]
    @order_id = params[:id]
    index = 0
    ActiveRecord::Base.transaction do
      @list_items_ids.each do |item_id|
        OrderItem.create! quantity: @list_quantity[index], tbl_order_id: @order_id,
        tbl_product_id: item_id
        @product = Product.find item_id
        @product.update!(stock: @product.stock - @list_quantity[index])
        index +=1
      end
    end

    @res = OrderItem.where(tbl_order_id: @order_id)
    render json: @res
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

  end
