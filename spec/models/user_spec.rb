# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  first_name    :string
#  last_name     :string
#  phone         :string
#  group_id      :integer
#  home_place_id :integer
#  work_place_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe User do

  def class_exists?(class_name)
    eval("defined?(#{class_name}) && #{class_name}.is_a?(Class)") == true
  end

  it "User class created" do
    expect(class_exists?("User"))
    expect(User < ActiveRecord::Base).to eq(true)        
  end

  context "User class properties added" do
    subject(:user) { User.new }
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:phone) }
    it { should respond_to(:group_id) }
    it { should respond_to(:home_place_id) }
    it { should respond_to(:work_place_id) }
  end

  it "User database structure is Ok!" do
    expect(User.column_names).to include "first_name", "last_name", "phone", 
      "group_id", "home_place_id", "work_place_id"
    expect(User.attribute_types["first_name"].type).to eq :string
    expect(User.attribute_types["last_name"].type).to eq :string
    expect(User.attribute_types["phone"].type).to eq :string
    expect(User.attribute_types["group_id"].type).to eq :integer
    expect(User.attribute_types["home_place_id"].type).to eq :integer
    expect(User.attribute_types["work_place_id"].type).to eq :integer
    expect(User.attribute_types["created_at"].type).to eq :datetime
    expect(User.attribute_types["updated_at"].type).to eq :datetime
  end
  
  context "validations" do
    it "does not allow a User without a first_name" do
      expect(User.new(:first_name=> "")).to_not be_valid
    end

    it "does not allow a User without a last_name" do
      expect(User.new(:last_name=> "")).to_not be_valid
    end

    it "does not allow a User without a phone" do
      expect(User.new(:phone=> "")).to_not be_valid
    end

    it "does not allow a User with a null first and last name" do
      expect(User.new(:first_name=>nil, :last_name=>nil)).to_not be_valid
    end

    it "does not allow a User with a null first name when last name present" do
      expect(User.new(:first_name=>nil, :last_name=>"Sayed")).to_not be_valid
    end
    it "does not allow a User with a null last name when first name present" do
      expect(User.new(:first_name=>"Mahmoud", :last_name=>nil)).to_not be_valid
    end
  end
end
