class AddDateTable < ActiveRecord::Migration
  def self.up
    create_table :days, :force => true do |t|
      t.date :d
      t.timestamps
    end
    
    t = (1.month.ago.to_date..18.months.from_now.to_date)
    t.each do |d|
      ActiveRecord::Base.connection.execute("INSERT INTO days (d, created_at, updated_at) VALUES ('#{d}', '#{DateTime.now}', '#{DateTime.now}')")
    end
    
  end

  def self.down
    drop_table :days
  end
end
