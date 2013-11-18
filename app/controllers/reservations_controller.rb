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
		between=range===@res.hour
		if between
			if @res.save
			
			
			
			@restaurant.totalsize=@restaurant.totalsize - @res.numberofseats
			@restaurant.save
			@res.save
			session[:restaurant_id]=nil

			redirect_to user_path(@user)
		end
	else
		debugger
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
