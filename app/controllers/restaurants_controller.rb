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

	def rate
		@restaurant=Restaurant.find_by_id(params[:restaurants_id])
		@rating=@restaurant.rating

	end

	def to_datetime(t)
    # Convert seconds + microseconds into a fractional number of seconds
    	
    	seconds = t.sec
    	year=t.year
    	day=t.day
    	hour=t.hour
    	min=t.min
    	month=t.month
    	offset = Rational(t.utc_offset, 60 * 60 * 24)


    # Convert a UTC offset measured in minutes to one measured in a
    # fraction of a day.
    	
    	val=DateTime.new(year, month, day, hour, min, seconds, offset)
    	val
  end

	def update
		ratings= {"Terrible"=>1, "Bad"=>2, "Average"=>3, "Good"=>4,"Great"=>5}
		rating=params[:restaurant][:rating]
		value=ratings[rating]
		@restaurant=Restaurant.find_by_id(params[:id])

		if @restaurant.update_attributes(restaurant_params)
			@restaurant.raters=@restaurant.raters+1
			@restaurant.rating=(@restaurant.rating+value).to_f/@restaurant.raters
			@restaurant.save


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
		open=Time.parse(params[:restaurant][:opentime])#, "%H:%M")
		close=Time.parse(params[:restaurant][:closetime])#, "%H:%M")
		range=open..close
		timerange=Time.parse(params[:restaurant][:opentime])
		times=[]
		until timerange>close
			times << timerange
			timerange=timerange + 1.hour
			 
		end




		if @res.save
			val.each do |date|

				@res.moments << Moment.new({date:date,
					                  seats:@res.totalsize})
			end
			times.each do |t|
				@res.moments.each do |day|


					day.slots << Slot.new({tock:t-5.hour, seats:@res.totalsize})


				end
			end




			@res.rating=0
			@res.raters=0
			@res.save
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
