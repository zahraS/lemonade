class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comments

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    @page = @note.page
    redirect_to [@page.user, @page]
  end

  private
    def set_comments
      @note = Note.find(params[:note_id])
      @comments = @note.comments
    end

    def comment_params
      params.require(:comment).permit(:content, :note_id, :user_id)
    end
end
