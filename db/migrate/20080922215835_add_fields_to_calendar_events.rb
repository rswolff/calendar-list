class AddFieldsToCalendarEvents < ActiveRecord::Migration
  def self.up
    add_column    :calendar_events, :start_time, :time
    add_column    :calendar_events, :end_time, :time
    rename_column :calendar_events, :start, :start_date
    rename_column :calendar_events, :end, :end_date
    change_column :calendar_events, :end_date, :date
    change_column :calendar_events, :start_date, :date
  end

  def self.down
    remove_column :calendar_events, :end_time
    remove_column :calendar_events, :start_time
    rename_column :calendar_events, :start_date, :start
    rename_column :calendar_events, :end_date, :end
    change_column :calendar_events, :end, :time
    change_column :calendar_events, :start, :date_time
  end
end
