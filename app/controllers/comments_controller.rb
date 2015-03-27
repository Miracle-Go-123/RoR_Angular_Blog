class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :upvote]  
  respond_to :json  

  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    respond_with @post, comment
  end

  def upvote
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.increment!(:upvotes)
    puts("Hello")
    respond_with @post, @comment
  end

  private
  def comment_params
    params.require(:comment).permit(:body)	
  end

end
