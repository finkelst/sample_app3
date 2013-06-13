class StaticPagesController < ApplicationController
  def home
   
  end

  def help
  end

  def about
  end

  def contact
  end
  
  def add_price
	if signed_in?
		 @price = current_user.prices.build
		 
	end
  end
end
