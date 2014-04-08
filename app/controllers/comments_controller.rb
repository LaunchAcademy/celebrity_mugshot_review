class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  def create
    @mugshot = Mugshot.find(params[:mugshot_id])
    @comment = current_user.comments.build(comment_params)
    @comment.mugshot = @mugshot

    if @comment.save
      redirect_to @mugshot,
        notice: "New comment Submitted!"
    else
      render 'new'
    end
  end

protected

  def comment_params
    params.require(:comment).permit(:title, :description)
  end
end
