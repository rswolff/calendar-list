class View < ActiveRecord::Base

  has_many :calendar_event_views
  has_many :calendar_events, :through => :calendar_event_views

end
