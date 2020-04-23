class UsersController < ApplicationController
  def index
  	@users = User.all
  	@user = current_user
  	@book = Book.new
  end

  def create
  	@user = User.new(
  		name: params[:name],
  		email: params[:email],
  		password: params[:password]
  		)
  	if @user.save
  		flash[:notice] = "Signed in successfully."
  		redirect_to users_pash(user.id)
  	end
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
  	if @user.id != current_user.id
  		redirect_to user_path(current_user)
  	end
  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
	def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
