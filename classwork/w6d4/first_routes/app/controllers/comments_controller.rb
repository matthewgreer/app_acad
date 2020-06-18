class CommentsController < ApplicationController
  def index
    if params[:comment_id] #left off here, not tested
      @comments = Comment.joins(:artwork_shares)
      .where("artworks.artist_id = #{params[:comment_id]} OR artwork_shares.viewer_id = #{params[:comment_id]}")
    else
      @comments = Comment.all  
    end
      render json: @comments
    end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_message, status: 422
    end
  end 

  def destroy 
    @comment = Comment.find(params[:id])
    @artwork = Comment.artwork_id
    @comment.destroy
    redirect_to artwork_url(@artwork)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end

end