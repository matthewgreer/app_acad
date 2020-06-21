class GardensController < ApplicationController

  def index
    @gardens = Garden.all
    render :index
  end

  def show
    @garden = Garden.find_by(id: [params[:id]])
    if @garden
      render :show
    else
      redirect_to gardens_url
    end
  end

  def create
      @garden = Garden.create(garden_parameters)
    if @garden.save
      redirect_to gardens_url
    else
      render :new
    end
  end

  private

  def garden_parameters #strong params
    self.params.require(:garden).permit(:name, :size, :garden_owner_id)
  end

end