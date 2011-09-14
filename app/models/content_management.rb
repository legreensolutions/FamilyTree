class ContentManagement < ActiveRecord::Base
  validates_presence_of :page, :identification, :no_of_chars,:description
end

