class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end


  def update
    @customer = Customer.find(current_customer.id)
      if @customer.update(customer_params)
      flash[:notice] = "You have Update User successfully."
      redirect_to my_page_path
      else
      render :edit
      end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

    private

  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :zip_code, :address, :telephone_number)
  end



end

