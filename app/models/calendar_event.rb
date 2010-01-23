class CalendarEvent < ActiveRecord::Base
  acts_as_taggable
  belongs_to :day
  belongs_to :category
  
  has_many :calendar_event_views
  has_many :views, :through => :calendar_event_views
  
  
  validates_presence_of :start_date, :name
  
  named_scope :future, lambda {{:conditions => ["start_date >= ?", Date.today], :order => 'start_date, start_time'}}
  named_scope :in_range, lambda { |s, e| {:conditions => ["start_date between ? and ?", s, e], :order => 'start_date, start_time'}}
  
  def formatted_start_datetime
    if event_has_start_time?
      d = DateTime.civil(y=self.start_date.year, m=self.start_date.month, d=self.start_date.day, h=self.start_time.hour, m=self.start_time.min, s=self.start_time.sec)
      d.strftime("%b %d, %I:%M %p")
    else
      d = Date.civil(y=self.start_date.year, m=self.start_date.month, d=self.start_date.day)
      d.strftime("%b %d")
    end
  end
  
  def date
    d = self.start_date.strftime("%b %d")
   
    unless self.end_date.nil?
      if (self.start_date.mon == self.end_date.mon)
        d << "/#{self.end_date.strftime("%d")}"
      else
        d << "/#{self.end_date.strftime("%b %d")}"
      end
    end
    d
  end
  
  def name_and_location
    name_and_location = self.name
    unless self.location.nil? || self.location == ''
      name_and_location << " (#{self.location})"
    end
    name_and_location
  end
  
  def event_has_start_time?
    self.start_time
  end
  
  def toggle_emphasis
    if self.emphasis == true
      self.emphasis = false
    else
      self.emphasis = true
    end
  end
end
