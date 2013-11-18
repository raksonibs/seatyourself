class UsersController < ApplicationController
  def index
    debugger
  end
  def new
  	@user=User.new
    @categories=@user.categories.new
  end

  def joinnew
    @user=current_user
    @reservation=Reservation.new

    render 'joinnew'
  end

  def joinncreate
    @user=User.find_by_id(params[:user_id])
    @reservation=@user.reservations.build(reservation_params)
    if @reservation_params.save
      redirect_to @user
    else
      render 'joinnew'
    end
  end

  def create
  	@user=User.new(user_params)
    save=true

    if params[:owner]==nil && params[:ruser]==nil
      save=false
    end
  	if @user.save && save
      if params[:ruser]

       @user.categories << Category.new({text:"ruser"})
    end
    if params[:owner] 
      @category=@user.categories

      @user.categories << Category.new({text:"owner"})
    end
  		redirect_to "/welcome_path", :notice => "Signed up!"
  	else
  		render "new"
  	end
  end

  def update
    @user=User.find_by_id(params[:id])
    save=true
    

    if params[:owner]==nil && params[:ruser]==nil
      save=false
    end
    if @user.update_attributes(user_params) && save
      if params[:ruser]
       @user.categories<< Category.new({text:"owner"})
    end
    if params[:owner] 
      @user.categories<< Category.new({text:"owner"})
    end
      redirect_to "/welcome_path", :notice => "Signed up!"
    else
      render "new"
    end
 
  end

  def edit
    @user=User.find_by_id(params[:id])
    @categories=@user.categories
  end

   def show
	@user=User.find(params[:id])
  @restaurantsown=[]
  if @user.categories.find{|c| c.text=="owner"}
    Restaurant.all.each do |rest|
      @restaurantsown << rest if rest.owner.to_i ==current_user.id

    end
  end
  @restaurantsown
  @restaurants=Restaurant.all
  @reservations=@user.reservations
    
	session[:user_id]=@user.id
	end

  private
  def user_params
  	params.require(:user).permit(:email,:password, :password_confirmation, :name)
  end

  def reservation_params
    params.require(:reservation).permit(:hour,:user_id,:restaurant_id)
  end
end
