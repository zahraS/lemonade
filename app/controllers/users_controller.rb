class UsersController < ApplicationController
  before_action :authenticate_user!

  def search
    q = params[:q]
    @users = User.where("email LIKE ?", "#{q}%")
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end
end
