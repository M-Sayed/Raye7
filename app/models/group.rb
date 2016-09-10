# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :users
  has_many :trips, through: :users, source: :trips
end
