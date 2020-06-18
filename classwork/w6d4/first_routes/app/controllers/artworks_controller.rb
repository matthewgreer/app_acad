class ArtworksController < ApplicationController
  
  def index
    if params[:user_id]
      @artworks = Artwork.joins(:artwork_shares)
      .where("artworks.artist_id = #{params[:user_id]} OR artwork_shares.viewer_id = #{params[:user_id]}")
    else
      @artworks = Artwork.all  
    end
      render json: @artworks
  end

  def create
    @artworks = Artwork.new(artwork_params)
    if @artworks.save
      render json: @artworks
    else
      render json: @artworks.errors.full_messages, status: 422
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    render json: @artwork
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update(artwork_params)
      redirect_to artwork_url(@artwork)
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to artworks_url
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
