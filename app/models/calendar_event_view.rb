class CalendarEventView < ActiveRecord::Base
  belongs_to :calendar_event
  belongs_to :view
end