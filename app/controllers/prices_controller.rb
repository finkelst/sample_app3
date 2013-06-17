class PricesController < ApplicationController
  # respond_to :json, :html, :json, :js
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy
  

  def create
    @price = current_user.prices.build(params[:price])
    if @price.save
      flash[:success] = "price created!"
      redirect_to edit_price_path(current_user)
    else
      render 'static_pages/add_price'
    end
  end

  def destroy
    @price.destroy
    redirect_to root_path
  end
  
    
  def edit
    @datagrid   = Hash.new { |h,v| h[v] = {} }
    current_user.prices.each do |record|
      date = record.date
      @datagrid[date.year][date.month] = record
    end
	
  end

  def update
    @price=current_user.prices.find(params[:id])
    # if @price.update_attributes(params[:price])
      # flash[:success] = "Price updated"
	  # respond_with(@price, :location => price_url(@price))
      
    # else
      # render 'edit'
    # end
	respond_to do |format|
    if @price.update_attributes(params[:price])
      format.html { redirect_to(@price, :notice => 'Price was successfully updated.') }
      format.json { respond_with_bip(@price) }
    else
      format.html { render :action => "edit" }
      format.json { respond_with_bip(@price) }
    end
   end
  end

  private
  
  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end
	
  def correct_user
    @price = current_user.prices.find_by_id(params[:id])
    redirect_to root_path if @price.nil?
  end
  
end