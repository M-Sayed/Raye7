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

FactoryGirl.define do
  factory :trip do
    driver_id 1
    source_id 1
    destination_id 2
    seats 2
  end
end
