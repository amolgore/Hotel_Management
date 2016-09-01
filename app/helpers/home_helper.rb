module HomeHelper

# Query to retreive categories wise booked rooms
  def find_available_rooms(room_type, start_date, end_date)

    query = "SELECT result.*, booking_statuses.* FROM
                (SELECT rooms.id, rooms.number, rooms.room_category_id from rooms
                  INNER JOIN room_categories
                  ON room_categories.id = rooms.room_category_id AND room_categories.id = #{room_type}
                )
                AS result
                  INNER JOIN booking_statuses
                  ON booking_statuses.room_id = result.id AND booking_statuses.start_date BETWEEN '"+ start_date + "' AND '" +
                  end_date + "'"
    result = BookingStatus.find_by_sql(query)
  end
end
