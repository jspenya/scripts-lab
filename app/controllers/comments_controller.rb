class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only[:create, :destroy]
  before_action :set_meeting

  def new
    @comment = Comment.new
  end

  def create
    @comment = @meetings.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    respond_to do |format|
      format.html { redirect_to @meeting }
      format.js
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
