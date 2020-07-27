class Api::PokemonController < ApplicationController
  
  def index
    @pokemons = Pokemon.all.includes(:items)
  end

  def show
    @pokemon = Pokemon.find(params[:id])

  end

  def pokemon_params 
    params.require(:pokemon).permit(:id, :name, :image_url)
  end


end
