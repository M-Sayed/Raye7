require 'spec_helper'

#   TODO:: Testing Refactoring
describe Api::V1::GroupsController do
  before(:each) { request.headers['Accept'] = "application/vnd.Raye7.v1" }

  describe "GET index" do
    before(:each) do
      get :index, format: :json
    end

    it "returns a data array" do
      groups_response = JSON.parse(response.body)
      expect(groups_response).to be_kind_of Array
    end

    it { should respond_with 200 }
  end


  describe "POST #create", type: :controller do
    context "when is successfully created" do
      before(:each) do
        @group_attributes = FactoryGirl.attributes_for :group
        post :create, { group: @group_attributes }, format: :json
      end

      it "renders the json representation for the group record just created" do
        group_response = JSON.parse(response.body, symbolize_names: true)
        expect(group_response[:name]).to eql @group_attributes[:name]
      end
      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_group_attributes = { name: "" }
        post :create, { group: @invalid_group_attributes }, format: :json
      end

      it "renders an errors json" do
        group_response = JSON.parse(response.body, symbolize_names: true)
        expect(group_response).to have_key(:errors)
      end

      it "renders the json errors on why the group could not be created" do
        group_response = JSON.parse(response.body, symbolize_names: true)
        expect(group_response[:errors][:name]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end
end
