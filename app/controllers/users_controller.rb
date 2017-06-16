class UsersController < ApplicationController
  skip_before_action :authorize

  def index
    @users = User.order(:name)
    @operators = Operator.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    flash[:notice] = "User account successfully created =)"
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    flash[:notice] = "User account was successfully updated =)"
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User was successfully deleted =)"
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :operator_id)
    end
end
