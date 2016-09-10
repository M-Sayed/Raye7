# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  trip_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Membership < ApplicationRecord
  validate :seats_availablity
  validates_presence_of :user, :trip
  belongs_to :user
  belongs_to :trip

  def seats_availablity
    self.trip.seats > self.trip.users.count - 1 # -1 for the driver.
  end
end
