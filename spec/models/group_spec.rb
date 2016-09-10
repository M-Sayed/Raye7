# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'


describe Group do
  def class_exists?(class_name)
    eval("defined?(#{class_name}) && #{class_name}.is_a?(Class)") == true
  end

  it "Group class created" do
    expect(class_exists?("Group"))
    expect(Group < ActiveRecord::Base).to eq(true)        
  end

  context "Group class properties added" do
    subject(:group) { Group.new }
    it { should respond_to(:name) }
  end

  it "Group database structure is Ok!" do
    expect(Group.column_names).to include "name"
    expect(Group.attribute_types["name"].type).to eq :string
  end
  
  context "validations" do
    it "does not allow a Group without a name" do
      expect(Group.new(:name=> "")).to_not be_valid
    end

    describe "uniqueness" do
      subject { Group.create(name: "Group 1") }
      it { should validate_uniqueness_of(:name) }
    end    
  end
end
