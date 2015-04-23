class ContentManagement < ActiveRecord::Base
attr_accessible :page, :identification, :no_of_chars, :description
# sujith - these attributes added by Sujith

  validates_presence_of :page, :identification, :no_of_chars,:description
end

