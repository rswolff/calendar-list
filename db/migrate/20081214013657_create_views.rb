class CreateViews < ActiveRecord::Migration
  def self.up
    create_table :views do |t|
      t.string :name
      t.integer :sort_order

      t.timestamps
    end
    
    View.create(:name => "Conferences", :sort_order => 300)
    View.create(:name => "High Council Meetings", :sort_order => 100)
    View.create(:name => "Stake Presidency Meetings", :sort_order => 200)
    
    create_table :calendar_event_views do |t|
      t.integer :calendar_event_id
      t.integer :view_id
    end
  end

  def self.down
    drop_table :views
    drop_table :calendar_event_views
  end
end
