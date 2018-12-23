class V1::AccountsController < ApplicationController
  before_action :set_account, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request

  # GET /accounts/1
  def show
    render json: @account, :include => {:user => {only: [:email, :phone]}}
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)
    if @account.save
      render json: @account, status: :created, location: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def account_params
      params.require(:account).permit(:name, :city, :address, :dob)
    end
  end
