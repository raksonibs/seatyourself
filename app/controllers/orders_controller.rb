class OrdersController < ApplicationController
	def create
		@user=User.find_by_id(params[:user_id])
		@item=Item.find_by_id(params[:item_id])
		@rest=Restaurant.find_by_id(params[:restaurant_id])
		@menu=Menu.find_by_id(params[:menu_id])
		if @user.orders.where(menu_id: @menu.id)==[]
			@order=Order.new({
				              :restaurant_id=>@rest.id,
				              :menu_id=>@menu.id,
				              :user_id=>@user.id
				              })
		else
			@order=Order.find_by_menu_id(@menu.id)
		end
		@item.quantity=0 if @item.quantity==nil
		@item.save
		@item.quantity=@item.quantity+1
		@item.save

		debugger
		if @order.save
			@order.items << @item
			@order.save
			debugger
			redirect_to restaurant_menu_path(@rest,@menu)
		else
			redirect_to @menu
		end
	end
	private


	def order_params
    	params.require(:order).permit(:item_id,:user_id,:restaurant_id,:menu_id)
  	end
end
