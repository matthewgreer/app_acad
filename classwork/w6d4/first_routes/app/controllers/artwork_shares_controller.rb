class ArtworkSharesController < ApplicationController

  def create
    @artwork_share = ArtworkShare.new(artwork_params)
    if @artwork_share.save
      render json: @artwork_share
    else
      render json: @artwork_share.errors.full_messages, status: 422
    end
  end

  def destroy
    @artwork_share = ArtworkShare.find(params[:id])
    @artwork_share.destroy
    redirect_to users_url
  end

  private 
  
  def artwork_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end

end