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

class Place < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :longitude, presence: true
  validates :latitude, presence: true
end
