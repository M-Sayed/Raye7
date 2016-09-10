# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  name       :string
#  longitude  :string
#  latitude   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Place do

  def class_exists?(class_name)
    eval("defined?(#{class_name}) && #{class_name}.is_a?(Class)") == true
  end
  
  it "Place class created" do
    expect(class_exists?("Place"))
    expect(Place < ActiveRecord::Base).to eq(true)        
  end

  context "Place class properties added" do
    subject(:place) { Place.new }
    it { should respond_to(:name) }
    it { should respond_to(:longitude) }
    it { should respond_to(:latitude) }
  end

  it "Place database structure is Ok!" do
    expect(Place.column_names).to include "name", "longitude", "latitude"
    expect(Place.attribute_types["name"].type).to eq :string
    expect(Place.attribute_types["longitude"].type).to eq :string
    expect(Place.attribute_types["latitude"].type).to eq :string
  end
  
  context "validations" do
    it "does not allow a Place without a name" do
      expect(Place.new(:name=> "")).to_not be_valid
    end

    it { should validate_uniqueness_of(:name) }

    it "does not allow a Place without a longitude" do
      expect(Place.new(:longitude=> "")).to_not be_valid
    end

    it "does not allow a Place without a latitude" do
      expect(Place.new(:latitude=> "")).to_not be_valid
    end
  end
end
