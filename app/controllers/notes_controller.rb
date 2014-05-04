class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notes

  def edit
    @note = @notes.find(params[:id])
  end

  def create
    @note = @notes.new(note_params)
    @note.user = current_user
    @note.save
    redirect_to [@user, @current_page]
    # redirect_to 
  end

  def update
    @note = @notes.find(params[:id])
    @note.update(note_params)
    respond_with(@user, @current_page, @note)
  end

  def destroy
    @note = @notes.find(params[:id])
    @note.destroy
    respond_with(@user, @current_page, @note)
  end

  private
    def note_params
      params.require(:note).permit(:content, :private)
    end

    def set_notes
      @user = User.find(params[:user_id])
      @current_page = @user.pages.where(published_at: params[:page_id]).first
      @notes = @current_page.notes
    end
end
