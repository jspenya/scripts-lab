class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to @commentable }
        format.js {  }
      end
    else
      format.html { redirect_to @commentable, notice: "There was an error creating the comment." }
    end
  end

  def destroy
    @comment = @meetings.comment.find(params[:id])
    @comment.destroy

    redirect_to @meeting
  end

  private
  def set_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
  
  def comment_params
    params
    .require(:comment)
    .permit(:body)
  end
end
