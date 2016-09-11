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

class Trip < ApplicationRecord
  validate :not_same_places
  validates_presence_of :driver
  validates :seats, numericality: { greater_than: 0 }
  validates_presence_of :source_place, :destination_place

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships, source: :user
  belongs_to :driver, class_name: 'User', foreign_key: :driver_id
  belongs_to :source_place, class_name: 'Place', foreign_key: :source_id
  belongs_to :destination_place, class_name: 'Place', foreign_key: :destination_id

  def not_same_places
    if self.source_place == self.destination_place
      errors.add(places: "Source and destination should not be the same")
    end
  end
end
