class FlowersController < ApplicationController

  def create
    @flower = Flower.create(flower_parameters)
    if @flower.save
      redirect_to garden_url(@flower.garden_id)
    else
      redirect_to garden_url(@flower.garden_id)
    end
  end

  def destroy
    @flower = Flower.find_by(id: params[:id])
    @flower.destroy
    redirect_to garden_url(@flower.garden_id)
  end

  private

  def flower_parameters #strong params
    self.params.require(:flower).permit(:flower_type, :gardener_id, :garden_id)
  end

end