class AddAllDayToCalendarEvents < ActiveRecord::Migration
  def self.up
    add_column :calendar_events, :all_day, :boolean
  end

  def self.down
    remove_column :calendar_events, :all_day
  end
end
