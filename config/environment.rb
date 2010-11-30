# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
OpenMyMind::Application.initialize!

Time::DATE_FORMATS[:default] = '%A %B %d, %Y'