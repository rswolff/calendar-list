class Category < ActiveRecord::Base
  has_many :calendar_events
end
