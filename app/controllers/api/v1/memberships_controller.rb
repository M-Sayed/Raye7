class Api::V1::MembershipsController < ApplicationController
  respond_to :json

  def create
    @membership = Membership.new membership_params
    if @membership.save
      render json: @membership, status: 201 # , location: [:api, @membership]
    else
      render json: { errors: @membership.errors }, status: 422
    end
  end

  def destroy
    @membership = Membership.where(user_id: params[:user_id], trip_id: params[:trip_id]).first

    @membership.destroy
    respond_to do |format|
      format.json { head :ok, Errors: @membership.errors.to_a.join(', ') }
    end
  end

  private
    def membership_params
      params.permit(:user_id, :trip_id)
    end
end
