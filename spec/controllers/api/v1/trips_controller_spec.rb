require 'spec_helper'

#   TODO:: Testing Refactoring
describe Api::V1::TripsController do
  before(:each) { request.headers['Accept'] = "application/vnd.Raye7.v1" }

  # describe "GET index" do
  #   before(:each) do
  #     get :index, format: :json
  #   end

  #   it "returns a data array" do
  #     groups_response = JSON.parse(response.body)
  #     expect(groups_response).to be_kind_of Array
  #   end

  #   it { should respond_with 200 }
  # end

  describe "POST #create", type: :controller do
    context "when is successfully created" do
      before(:each) do
        @trip_attributes = FactoryGirl.attributes_for :trip
        post :create, { trip: @trip_attributes }, format: :json
      end

      it "renders the json representation for the trip record just created" do
        trip_response = JSON.parse(response.body, symbolize_names: true)
        expect(trip_response[:driver_id]).to eql @trip_attributes[:driver_id]
        expect(trip_response[:departure_time]).to eql @trip_attributes[:departure_time]
        expect(trip_response[:source_id]).to eql @trip_attributes[:source_id]
        expect(trip_response[:destination_id]).to eql @trip_attributes[:destination_id]
        expect(trip_response[:seats]).to eql @trip_attributes[:seats]
      end
      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_trip_attributes = { driver_id: nil, source_id: 1, destination_id: 1 }
        post :create, { trip: @invalid_trip_attributes }, format: :json
      end

      it "renders an errors json" do
        trip_response = JSON.parse(response.body, symbolize_names: true)
        expect(trip_response).to have_key(:errors)
      end

      it "renders the json errors on why the trip could not be created" do
        trip_response = JSON.parse(response.body, symbolize_names: true)
        expect(trip_response[:errors][:driver_id]).to include "must exist"
        expect(trip_response[:errors][:places]).to include "Source and destination should not be the same"

      end

      it { should respond_with 422 }
    end
  end
end
