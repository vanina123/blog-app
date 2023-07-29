class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = @user
    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment created successfully'
    else
      render :new, alert: 'Error: Comment could not be saved'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
