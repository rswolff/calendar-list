class Day < ActiveRecord::Base
  has_many :calendar_events, :foreign_key => 'start_date'
  set_primary_key "d"
end