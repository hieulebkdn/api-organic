class V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy, :fetch_product_reviews]
  skip_before_action :authenticate_request

  # GET /products
  def index
    @products = Product.all.select :id, :name, :price, :unit, :stock, :rating, :buy

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  def fetch_product_reviews
    @reviews = @product.reviews
    render json: @reviews
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.permit(:name, :price, :unit, :stock, :sku, :tbl_category_id)
    end
  end
