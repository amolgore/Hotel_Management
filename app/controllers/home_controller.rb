class HomeController < ApplicationController
  before_action :authenticate_user!, only: [ :user_dashboard ]
  include HomeHelper

# Index action to shoe home page for non logged in user
  def index

  end
# Method for user dashboard and show user booking statuses.
  def user_dashboard
    @room_id = BookingStatus.where(user_id:current_user).pluck(:room_id).uniq

  end

# Method to search available rooms
  def search_available_rooms
    room_type = params[:room_type].to_i
    start_date = params[:start_date]
    end_date = params[:end_date]
    booked_rooms = find_available_rooms(room_type, start_date, end_date)
    booked_rooms_id = []
    booked_rooms.each do |room|
      booked_rooms_id.push(room.room_id)
    end
    filtered_rooms_on_room_type = RoomCategory.find(room_type).rooms.pluck(:id)
    @available_rooms = filtered_rooms_on_room_type - booked_rooms_id
    respond_to do |format|
      format.html
      format.js
    end
  end

# Method for booking the rooms
  def booked_room
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    (start_date..end_date).each do |date|
      booked_room = BookingStatus.new(
          start_date: date,
          user_id: current_user.id,
          room_id: params[:room_id]
      )

      booked_room.save
    end
  end

# Method for showing the room categories
  def book_rooms
    @room_category= RoomCategory.all
  end

end
