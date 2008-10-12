class CreateCalendarEvents < ActiveRecord::Migration
  def self.up
    create_table :calendar_events do |t|
      t.datetime :start
      t.time :end
      t.string :name
      t.string :location
      t.integer :category_id
      t.boolean :emphasis

      t.timestamps
    end
  end

  def self.down
    drop_table :calendar_events
  end
end
