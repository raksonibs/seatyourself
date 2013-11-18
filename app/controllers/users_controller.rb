class UsersController < ApplicationController

  def new
  	@user=User.new
    @categories=@user.categories.new
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
  @restaurants=[]
  Restaurant.all.each do |rest|
    @restaurants << rest if rest.owner.to_i ==current_user.id

  end
  @restaurants
    
	session[:user_id]=@user.id
	end

  private
  def user_params
  	params.require(:user).permit(:email,:password, :password_confirmation, :name)
  end
end
