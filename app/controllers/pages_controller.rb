class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @pages = current_user.pages
    respond_with(@pages)
  end

  def today
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end
    redirect_to user_page_path(@user, Time.now.strftime("%F"))
  end

  def show
  	@user = User.find(params[:user_id])
    @page = @user.pages.where(published_at: params[:id]).first_or_create
    respond_with(@page)
  end
end
