class Room < ActiveRecord::Base
  belongs_to :room_category
  has_many :booking_statuses
end
