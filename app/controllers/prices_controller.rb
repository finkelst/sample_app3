class PricesController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy

  def create
    @price = current_user.prices.build(params[:price])
    if @price.save
      flash[:success] = "price created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @price.destroy
    redirect_to root_path
  end

  private

    def correct_user
      @price = current_user.prices.find_by_id(params[:id])
      redirect_to root_path if @price.nil?
    end
end