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

class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, uniqueness: true
  
  belongs_to :group
  has_many :trips, foreign_key: 'driver_id', dependent: :destroy
  has_many :memberships, dependent: :destroy
end
