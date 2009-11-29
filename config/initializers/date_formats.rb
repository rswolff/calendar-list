ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(
  :short => "%Y-%m-%d",
  :med => "%d-%b-%Y",
  :med_with_day => "%d-%b-%Y (%a)",
  :long => "%A %B %d, %Y"
)
 
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(
  :military => "%H%M",
  :short => "%I:%M %p"
)