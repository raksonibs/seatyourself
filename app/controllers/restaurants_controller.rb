class RestaurantsController < ApplicationController
	before_filter :load_restuarant
	def index
		@restaurants= Resturant.all
	end

	def show
		load_restuarant
	end

	def edit
		load_restuarant
	end

	def new
		@restuarant=Resturant.new
	end

	def update
		@res=load_restuarant
		if @res.update_attributes(restuarant_params)
			redirect_to restuarant_path(@res)
		else
			render 'edit'
		end
	end

	def create
		@res=load_restuarant
		@res.owner=current_user
		if @res.save
			redirect_to restuarant_path
		else
			render 'new'
		end
	end

	def destroy
		@res=load_restuarant.destroy
		redirect_to user_path(current_user)
	end


	private
	def load_restuarant
		@restuarant=Resturant.find[params[:id]] if params[:id]
	end

	def restuarant_params
		params.require(:restuarant).permit(:name)
	end
end
