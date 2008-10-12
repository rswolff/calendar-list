class AddDescriptionToCalendarEvents < ActiveRecord::Migration
  def self.up
    add_column :calendar_events, :description, :text
  end

  def self.down
    remove_column :calendar_events, :description
  end
end
