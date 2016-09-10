require 'spec_helper'

#   TODO:: Testing Refactoring
describe Api::V1::PlacesController do
  before(:each) { request.headers['Accept'] = "application/vnd.Raye7.v1" }

  describe "GET index" do
    before(:each) do
      get :index, format: :json
    end

    it "returns a data array" do
      places_response = JSON.parse(response.body)
      expect(places_response).to be_kind_of Array
    end

    it { should respond_with 200 }
  end


  describe "POST #create", type: :controller do
    context "when is successfully created" do
      before(:each) do
        @place_attributes = FactoryGirl.attributes_for :place
        post :create, { place: @place_attributes }, format: :json
      end

      it "renders the json representation for the place record just created" do
        place_response = JSON.parse(response.body, symbolize_names: true)
        expect(place_response[:name]).to eql @place_attributes[:name]
        expect(place_response[:longitude]).to eql @place_attributes[:longitude]
        expect(place_response[:latitude]).to eql @place_attributes[:latitude]
      end
      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_place_attributes = { name: "", longitude: "", latitude: ""}
        post :create, { place: @invalid_place_attributes }, format: :json
      end

      it "renders an errors json" do
        place_response = JSON.parse(response.body, symbolize_names: true)
        expect(place_response).to have_key(:errors)
      end

      it "renders the json errors on why the place could not be created" do
        place_response = JSON.parse(response.body, symbolize_names: true)
        expect(place_response[:errors][:name]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end
end
