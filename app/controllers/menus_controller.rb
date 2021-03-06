class MenusController < ApplicationController


	def index
		@menus= Menu.all
	end

	def show

		if params[:id]
			@menu=Menu.find_by_id(params[:id])
		elsif
			@menu=Menu.find_by_id(params[:menu_id])
		end

		@rest=Restaurant.find_by_id(@menu.restaurant_id)
		@user=User.find_by_id(current_user)
		if @menu.orders!=[]
			@order=@menu.orders.where(user_id: current_user.id)[0]

			
		end
	end

	def edit
		@menu=menu.find_by_id(params[:id])
	end

	def new
		@rest=Restaurant.find_by_id(params[:restaurant_id])
		@menu=@rest.menus.build
	end

	def update
		@menu=menu.find_by_id(params[:id])
		if menu.update_attributes(menu_params)
			redirect_to menu_path(@res)
		else
			render 'edit'
		end
	end

	def create
		@rest=Restaurant.find_by_id(params[:restaurant_id])
		@menu=@rest.menus.build(menu_params)
				if @menu.save


			
			



					@rest.save


					
					redirect_to restaurant_menu_path(@rest,@menu)
		else

		flash[:error]="No submission buddy"
		redirect_to @rest
		
		end
	end

	def destroy
		@menu=menu.find_by_id(params[:id])
		@restaurant=Restaurant.find_by_id(menu.restaurant_id)


		@restaurant.save
		@menu.destroy
		redirect_to user_path(current_user)
	end


	private


	def menu_params
    params.require(:menu).permit(:season)
  end

end
