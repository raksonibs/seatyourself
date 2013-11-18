class CategoriesController < ApplicationController
  def new
  	@category=Category.new
  end

  def create
  	@user=User.new(user_params)
  	@category = @user.pendingtasks.build(category_params
  end

  private
  def category_params
  	params.require(:category).permit(:text)
  end
end
