class Api::V1::PlacesController < ApplicationController
  respond_to :json
  def index
    respond_with Place.all
  end
  
  def create
    @place = Place.new(place_params)
    if @place.save
      render json: @place, status: 201, location: [:api, @place]
    else
      render json: { errors: @place.errors }, status: 422
    end
  end

  private
    def place_params
      params.require(:place).permit(:name, :longitude, :latitude)
    end
end
