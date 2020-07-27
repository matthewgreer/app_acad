class GifsController < ApplicationController

  def create
    # debugger
    gif = Gif.new(gif_params)
    # in gif params, there will be an object(gif) of title and gif url. 
    if gif.save
      render json: gif
    else
      render json: gif.errors.full_messages, status: 422
    end
  end

  def search #custom action
    gif = Gif.find_by_title(params[:title])
    if gif
      render json: gif
      # ^if we find the gif, send it to frontend as js object
    else
      render json: ["There is no GIF with that title!"], status: 422
    end
  end

private
  def gif_params
    params.require(:gif).permit(:title, :url)
  end
end
