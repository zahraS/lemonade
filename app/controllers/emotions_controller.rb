class EmotionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @page = @user.pages.where(published_at: params[:page_id]).first
    @emotion = @page.emotions.new(emotion_params)
    @emotion.save
    redirect_to [@user, @page]
  end

  def destroy
    @user = User.find(params[:user_id])
    @page = @user.pages.where(published_at: params[:page_id]).first
    @emotion = @page.emotions.find(params[:id])
    @emotion.destroy
    redirect_to [@user, @page]
  end

  private
  def emotion_params
    params.require(:emotion).permit(:emotion_type)
  end
end
