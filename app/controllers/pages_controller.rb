class PagesController < ApplicationController
 before_action :authenticate_user!
  def index
    @pages = current_user.pages
    respond_with(@pages)
  end

  def show
  	@user = User.find(params[:user_id])
    @page = @user.pages.where(published_at: params[:id]).first_or_create
    respond_with(@page)
  end
end
