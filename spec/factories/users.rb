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

FactoryGirl.define do
  factory :user do
    first_name "FName"
    last_name "LName"
    phone "01111111111"
    group_id 2
    home_place_id 1
    work_place_id 2
  end
end
