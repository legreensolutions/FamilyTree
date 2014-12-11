class Event < ActiveRecord::Base
  validates_presence_of :title,:description,:event_date
  has_many :event_uploads  #,:attributes => true, :discard_if => proc { |upload| upload.photo_file_size.nil? }
  attr_accessible :title, :description, :event_date, :tags, :user_id, :event_uploads_attributes, :photo
  accepts_nested_attributes_for :event_uploads

end

