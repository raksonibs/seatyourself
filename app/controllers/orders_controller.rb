class OrdersController < ApplicationController
	def create
		@order=user.order.build(order_params)
	end
	private


	def order_params
    	params.require(:order).permit(:user_id,:restaurant_id)
  	end
end
