class Api::LaughsController < ApplicationController
  def index
    # debugger
    @laughs = Laugh.all.includes(:author)
    # render json: @laughs #rendering json renders string representation of a JS object
    # Rails will automatically render the view with a matching name, this is the API laughs controller, so it renders views/api/laughs/index
  end

  def show
    @laugh = Laugh.find(params[:id])
    if @laugh
      render :show
    else
      render json: ["No laugh found"]
    end
  end

  def create
    # debugger
    @laugh = Laugh.new(laugh_params)
    @laugh.author = User.first
    if @laugh.save
      render json: @laugh
    else
      render json: @laugh.errors.full_messages, status: 422
    end
  end

  private

  def laugh_params
    params.require("laugh").permit(:body)
  end
end