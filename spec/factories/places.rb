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

FactoryGirl.define do
  factory :place do
    name "​Maadi"
    longitude "1234"
    latitude "567"
  end
end
