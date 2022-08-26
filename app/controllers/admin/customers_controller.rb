class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customer = Customer.all
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    flash[:notice] = "You have Update User successfully."
    redirect_to admin_customer_path(@customer)
    else
    render :edit
    end

  end

    private

  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end

end