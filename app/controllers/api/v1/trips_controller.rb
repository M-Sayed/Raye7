class Api::V1::TripsController < ApplicationController
  respond_to :json

  def index
    @user = User.find params[:user_id]
    if @user and @user.group
      respond_with json: { trips: @user.group.trips }.to_json, status: 200
    else
      respond_with json: { errors: @user.errors }, status: 204
    end
  end

  def show
    @trip = Trip.find params[:id]
    if @trip
      respond_with json: { trip: @trip, users: @trip.users }.to_json, status: 200, location: [:api, @trip]
    else 
      respond_with json: { errors: @trip.errors }, status: 204
    end
  end

  def create
    @user = User.find params[:driver_id]
    trip = @user.trips.new trip_params
    if @user.save
      render json: trip, status: 201, location: [:api, trip]
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def destroy
    @user = User.find params[:driver_id]
    @user.trips.destroy params[:id]
  end

  private
    def trip_params
      params.permit(:driver_id, :source_id, :destination_id, :seats)
    end
end
