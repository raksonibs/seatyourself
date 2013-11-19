class MomentsController < ApplicationController

	def index
		@moments= Moment.all
	end

	def show
		@res=Restaurant.find_by_id(params[:id])
	end

	def edit
		@moment=Moment.find_by_id(params[:id])
	end

	def new
		@user=Restaurant.find_by_id(params[:restaurant_id])
		@moment=@user.moments.build
	end

	def update
		@moment=Moment.find_by_id(params[:id])
		if @res.update_attributes(moment_params)
			redirect_to moment_path(@res)
		else
			render 'edit'
		end
	end

	def create
		@user=User.find_by_id(params[:user_id])
		@res=@user.moments.build(moment_params)
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
		@res=moment.find_by_id(params[:id])
		@restaurant=Restaurant.find_by_id(@res.restaurant_id)
		@restaurant.totalsize=@restaurant.totalsize+@res.numberofseats
		@restaurant.save
		@res.destroy
		redirect_to user_path(current_user)
	end


	private


	def moment_params
    params.require(:moment).permit(:text, :seats)
  end

end

end
