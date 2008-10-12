class CreateCalendarEventPresets < ActiveRecord::Migration
  def self.up
    create_table :calendar_event_presets do |t|
      t.string :event_name
      t.time :event_time
      t.string :event_location
      t.text :event_tags

      t.timestamps
    end
    
    CalendarEventPreset.create(:event_name => "Stake Presidency Meeting", :event_time => '7:00 PM', :event_location => "WSC", :event_tags => "stake presidency")
    CalendarEventPreset.create(:event_name => "High Council Meeting",     :event_time => '7:00 AM', :event_location => "WSC", :event_tags => "stake presidency, high council")
    CalendarEventPreset.create(:event_name => "Bishops Training Meeting", :event_time => '8:00 PM', :event_location => "WSC", :event_tags => "stake presidency, bishops")
    
  end

  def self.down
    drop_table :calendar_event_presets
  end
end
