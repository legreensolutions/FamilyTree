class Event < ActiveRecord::Base
  has_many :event_uploads,
           :attributes => true,
           :discard_if => proc { |upload| upload.photo_file_size.nil? }
  accepts_nested_attributes_for :event_uploads

end

