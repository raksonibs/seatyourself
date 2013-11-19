class RestaurantsController < ApplicationController
	def index
		@restaurants= Restaurant.all
	end

	def show
		@res=Restaurant.find_by_id(params[:id])

	end

	def edit
		@restaurant=Restaurant.find_by_id(params[:id])
	end

	def new
		@restaurant=Restaurant.new
	end

	def update
		@restaurant=Restaurant.find_by_id(params[:id])
		if @restaurant.update_attributes(restaurant_params)
			redirect_to restaurant_path(@restaurant)
		else
			render 'edit'
		end
	end

	def create
		@res=Restaurant.new(restaurant_params)
		@res.owner=current_user
		@res.totalsize=@res.tablesize*@res.tables
		val=[]
		val<<"Monday" if params[:Monday]
		val<<"Tuesday" if params[:Tuesday]
		val<<"Wednesday" if params[:Wednesday]
		val<<"Thursday" if params[:Thursday]
		val<<"Friday" if params[:Friday]
		val<<"Saturday" if params[:Saturday]
		val<<"Saturday" if params[:Sunday]


		if @res.save
			val.each do |date|
				debugger
				@res.moments << Moment.new({date:date,
					                  seats:@res.totalsize})
			end
			redirect_to restaurant_path(@res)
			
		else
			render 'new'
		end
	end

	def destroy
		@res=Restaurant.find_by_id(params[:id]).destroy
		redirect_to user_path(current_user)
	end


	private


	def restaurant_params
		params.require(:restaurant).permit(:name,:opentime,:closetime,:tablesize,:address,:tables,:totalsize)
	end
end
