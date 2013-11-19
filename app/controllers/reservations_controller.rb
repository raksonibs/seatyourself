class ReservationsController < ApplicationController

	def index
		@reservations= Reservation.all
	end

	def show
		@res=Restaurant.find_by_id(params[:id])

	end

	def edit
		@reservation=Reservation.find_by_id(params[:id])
	end

	def new
		@user=User.find_by_id(params[:user_id])
		@reservation=@user.reservations.build
	end

	def update
		@reservation=Reservation.find_by_id(params[:id])
		if @res.update_attributes(reservation_params)
			redirect_to reservation_path(@res)
		else
			render 'edit'
		end
	end

	def create
		@user=User.find_by_id(params[:user_id])
		@res=@user.reservations.build(reservation_params)
		@res.restaurant_id=session[:restaurant_id]
		@restaurant=Restaurant.find_by_id(@res.restaurant_id)
		open=@restaurant.opentime.strftime("%H:%M")
		close=@restaurant.closetime.strftime("%H:%M")
		range=open..close
		dayon=@restaurant.moments.any?{|c|c.date==params[:reservation][:day]}
		val=@restaurant.reservations.where(hour: @res.hour) #.sum(:users) + @res.numberofseats 
		@cat=val.sum(:numberofseats) + @res.numberofseats

		dog=@cat < @restaurant.totalsize
		
		

		between=range===@res.hour
		if between
			if dayon
				if @res.save


			
			
			    
				@restaurant.moments.each do |c|
					c.seats=c.seats-@res.numberofseats if c.date==params[:reservation][:day]
					c.save
				end
				@restaurant.save
				@res.save
				session[:restaurant_id]=nil

				redirect_to user_path(@user)
				end
			end
	else

		flash[:error]="No submission buddy"
		redirect_to @user
		
	end
	end

	def destroy
		@res=Reservation.find_by_id(params[:id])
		@restaurant=Restaurant.find_by_id(@res.restaurant_id)
		@restaurant.totalsize=@restaurant.totalsize+@res.numberofseats
		@restaurant.save
		@res.destroy
		redirect_to user_path(current_user)
	end


	private


	def reservation_params
    params.require(:reservation).permit(:hour,:user_id,:restaurant_id, :day, :numberofseats)
  end

end
