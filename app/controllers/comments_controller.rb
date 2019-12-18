class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :set_post
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save

    yakkarma = current_user.yakkarma
    yakkarma.amount += 1
    yakkarma.save
  end

  def destroy
    if @comment.user == current_user
      @comment.destroy

      yakkarma = current_user.yakkarma
      yakkarma.amount -= 1
      yakkarma.save
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end

end
