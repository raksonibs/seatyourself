class RestaurantsController < ApplicationController
	def index
		@restaurants= Restaurant.all
	end

	def show
		@res=Restaurant.find_by_id(params[:id])

	end

	def edit
		@res=Restaurant.find_by_id(params[:id])
	end

	def new
		@restaurant=Restaurant.new
	end

	def update
		@res=Restaurant.find_by_id(params[:id])
		if @res.update_attributes(restaurant_params)
			redirect_to restaurant_path(@res)
		else
			render 'edit'
		end
	end

	def create
		@res=Restaurant.new(restaurant_params)
		@res.owner=current_user
		if @res.save
			redirect_to restaurant_path(@res)
		else
			render 'new'
		end
	end

	def destroy
		@res=load_restaurant.destroy
		redirect_to user_path(current_user)
	end


	private


	def restaurant_params
		params.require(:restaurant).permit(:name,:opentime,:closetime,:tablesize,:address,:tables)
	end
end
