class Day < ActiveRecord::Base
  has_many :calendar_events, :foreign_key => 'start_date', :order => "start_date, start_time"
  set_primary_key "d"
end