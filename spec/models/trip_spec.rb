# == Schema Information
#
# Table name: trips
#
#  id             :integer          not null, primary key
#  driver_id      :integer
#  source_id      :integer
#  destination_id :integer
#  seats          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  departure_time :date
#

require 'spec_helper'

describe Trip do
  def class_exists?(class_name)
    eval("defined?(#{class_name}) && #{class_name}.is_a?(Class)") == true
  end

  it "Trip class created" do
    expect(class_exists?("Trip"))
    expect(Trip < ActiveRecord::Base).to eq(true)        
  end

  context "Trip class properties added" do
    subject(:Trip) { Trip.new }
    it { should respond_to(:driver_id) }
    it { should respond_to(:source_id) }
    it { should respond_to(:destination_id) }
    it { should respond_to(:seats) }
  end

  it "Trip database structure is Ok!" do
    expect(Trip.column_names).to include "driver_id", "source_id", "destination_id", "seats"
    expect(Trip.attribute_types["driver_id"].type).to eq :integer
    expect(Trip.attribute_types["source_id"].type).to eq :integer
    expect(Trip.attribute_types["destination_id"].type).to eq :integer
    expect(Trip.attribute_types["seats"].type).to eq :integer
  end
  
  context "validations" do
    it "does not allow a Trip without a driver_id" do
      expect(Trip.new(:driver_id => nil)).to_not be_valid
    end

    it "does not allow a Trip without a source_id" do
      expect(Trip.new(:source_id => nil)).to_not be_valid
    end

    it "does not allow a Trip without a destination_id" do
      expect(Trip.new(:destination_id => nil)).to_not be_valid
    end

    it "does not allow a Trip without available seats" do
      expect(Trip.new(:seats => 0)).to_not be_valid
    end
  end
end
