class AddCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :sort_priority, :integer
    Category.create(:name => "Stake Presidency", :sort_priority => "1")
    Category.create(:name => "High Council", :sort_priority => "2")
    Category.create(:name => "Bishops", :sort_priority => "3")
    Category.create(:name => "Stake", :sort_priority => "4")
  end

  def self.down
    Category.delete(:all)
    remove_column :calendar_events, :sort_priority
  end
end
