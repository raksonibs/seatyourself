class ItemsController < ApplicationController
	def index
		@items= Item.all
	end

	def show
		@item=Item.find_by_id(params[:id])
		@menu=Menu.find_by_id(params[:menu_id])
	end

	def edit
		@item=item.find_by_id(params[:id])
	end

	def new
		@menu=Menu.find_by_id(params[:menu_id])
		@item=@menu.items.build
	end

	def update
		@item=item.find_by_id(params[:id])
		if item.update_attributes(item_params)
			redirect_to item_path(@res)
		else
			render 'edit'
		end
	end

	def create
		@menu=Menu.find_by_id(params[:menu_id])
		@rest=Restaurant.find_by_id(@menu.restaurant_id)
		@item=@menu.items.build(item_params)
				if @item.save


			
			



					@menu.save


					
					redirect_to restaurant_menu_path(@rest,@menu)
		else

		flash[:error]="No submission buddy"
		redirect_to @menu
		
		end
	end

	def destroy
		@item=Item.find_by_id(params[:id])
		debugger
		@menu=Menu.find_by_id(params[:menu_id])
		@rest=Restaurant.find_by_id(@menu.restaurant_id)


		@menu.save
		@item.destroy
		redirect_to restaurant_menu_path(@rest,@menu)
	end


	private


	def item_params
    params.require(:item).permit(:product,:price,:desc)
  end

end


