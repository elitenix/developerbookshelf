class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  private 

  	# store the cart in the session by indexing it with the symbol :cart_id
  	def current_cart
  		Cart.find(session[:cart_id])
	  rescue ActiveRecord::RecordNotFound
		  cart = Cart.create
		  session[:cart_id] = cart.id
		  cart
	end

end
