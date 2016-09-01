class AddColumnToBookingStatus < ActiveRecord::Migration
  def change
    add_column :booking_statuses, :end_date, :date
    rename_column :booking_statuses, :date, :start_date
  end
end
