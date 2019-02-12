class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :auth_user, only: [:show]

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user_params = params.permit(:first_name, :last_name, :description)

    if @user.update(user_params)
       redirect_to @user
    else
      flash[:danger] = "Il manque des informations"
      render :show
    end
   end

	def auth_user
	unless current_user.id == params[:id].to_i
		redirect_to root_path
	end
	puts current_user.id.class
	puts params[:id].class
end

end

