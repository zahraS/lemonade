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

  def follow
    @user = User.find(params[:id])
    
    raise if @user.followers.include? current_user

    # @user.follows.create(follower: current_user)
    @user.followers << current_user
    redirect_to @user
  end

  def unfollow
    @user = User.find(params[:id])
    @user.follows.where(follower: current_user).destroy_all
    redirect_to @user
  end
end
