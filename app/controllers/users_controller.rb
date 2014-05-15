class UsersController < ApplicationController
  before_action :authenticate_user!

  def search
    @query = params[:q]
    @users = User.where("email LIKE ?", "%#{@query}%")

    @users = @users.to_a.delete_if do |u|
      u.id == current_user.id
    end

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

  def update_profile
    @user = User.find(params[:id])
    raise if current_user.id != @user.id
    profile_params = params.require(:profile).permit(:display_name, :gender, :birth_date, :country, :avatar)
    current_user.profile.update(profile_params)
    redirect_to today_user_pages_path(current_user)
  end
end
