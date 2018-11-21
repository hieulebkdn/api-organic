    class TblCategoriesController < ApplicationController
      before_action :set_tbl_category, only: [:show, :update, :destroy]

  # GET /tbl_categories
  def index
    @tbl_categories = TblCategory.all

    render json: @tbl_categories
  end

  # GET /tbl_categories/1
  def show
    render json: @tbl_category
  end

  # POST /tbl_categories
  def create
    @tbl_category = TblCategory.new(tbl_category_params)

    if @tbl_category.save
      render json: @tbl_category, status: :created, location: @tbl_category
    else
      render json: @tbl_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tbl_categories/1
  def update
    if @tbl_category.update(tbl_category_params)
      render json: @tbl_category
    else
      render json: @tbl_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tbl_categories/1
  def destroy
    @tbl_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_category
      @tbl_category = TblCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tbl_category_params
      params.require(:tbl_category).permit(:name, :parent_id)
    end
  end
