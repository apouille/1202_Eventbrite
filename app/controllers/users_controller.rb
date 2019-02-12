class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :auth_user, only: [:show]

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

	def auth_user
	unless current_user.id == params[:id].to_i
		redirect_to root_path
	end
	puts current_user.id.class
	puts params[:id].class
end

end

