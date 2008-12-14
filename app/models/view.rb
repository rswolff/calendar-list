class View < ActiveRecord::Base

  has_many :calendar_event_views
  has_many :calendar_events, :through => :calendar_event_views, :order => 'start_date, start_time', :conditions => ['start_date >= ?', Date.today ]

end
