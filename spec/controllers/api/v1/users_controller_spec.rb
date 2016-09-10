require 'spec_helper'

#   TODO:: Testing Refactoring
describe Api::V1::UsersController do
  before(:each) { request.headers['Accept'] = "application/vnd.Raye7.v1" }
  # before :all do 
  #   Group.destroy_all
  #   Place.destroy_all
  #   User.destroy_all
  #   load "#{Rails.root}/db/seeds.rb"  
  # end

  describe "POST #create", type: :controller do
    context "when is successfully created" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, { user: @user_attributes }, format: :json
      end

      it "renders the json representation for the user record just created" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:first_name]).to eql @user_attributes[:first_name]
        expect(user_response[:last_name]).to eql @user_attributes[:last_name]
        expect(user_response[:phone]).to eql @user_attributes[:phone]
        expect(user_response[:group_id]).to eql @user_attributes[:group_id]
        expect(user_response[:home_place_id]).to eql @user_attributes[:home_place_id]
        expect(user_response[:work_place_id]).to eql @user_attributes[:work_place_id]
      end
      it { should respond_with 201 }
    end 
    context "when is not created" do
      before(:each) do
        @invalid_user_attributes = { first_name: "" }
        post :create, { user: @invalid_user_attributes }, format: :json
      end

      it "renders an errors json" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on why the user could not be created" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors][:first_name]).to include "can't be blank"
        expect(user_response[:errors][:last_name]).to include "can't be blank"
        expect(user_response[:errors][:phone]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  
end