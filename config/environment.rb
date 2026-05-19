# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

#Use this to prevent Rails from inserting 'field_with_error' class
#Above class will affect the layout of the page
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance| 
    html_tag.html_safe
end