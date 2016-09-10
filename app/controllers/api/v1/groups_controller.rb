class Api::V1::GroupsController < ApplicationController
  respond_to :json

  def index
    @group = Group.all
    respond_with @group
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      render json: @group, status: 201, location: [:api, @group]
    else
      render json: { errors: @group.errors }, status: 422
    end
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end
end
