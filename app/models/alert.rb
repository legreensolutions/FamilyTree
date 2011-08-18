class Alert < ActiveRecord::Base
  validates_presence_of :title,:description,:alert_date
  has_many :alert_uploads,
           :attributes => true,
           :discard_if => proc { |upload| upload.photo_file_size.nil? }
  accepts_nested_attributes_for :alert_uploads
end

