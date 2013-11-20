class OrdersController < ApplicationController
	def create
		@user=User.find_by_id(params[:user_id])
		@item=Item.find_by_id(params[:item_id])
		@restaurant=Restaurant.find_by_id(params[:restaurant_id])
		@menu=Menu.find_by_id(params[:menu_id])
		@order=@user.orders.build()
		@order.items.each do |item|
			item.quantity=0 if item.quantity==nil
			item.save
			item.quantity=item.quantity+1
			item.save
			debugger
		end
		
		if @order.save
			debugger
		else
			redirect_to @menu
		end
	end
	private


	def order_params
    	params.require(:order).permit(:item_id,:user_id,:restaurant_id)
  	end
end
