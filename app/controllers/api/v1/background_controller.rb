class Api::V1::BackgroundController < ApplicationController
  def index
    background = Background.search(background_params[:location])
    render json: BackgroundSerializer.new(background)
  end

  private

  def background_params
    params.permit(:location)
  end
end
