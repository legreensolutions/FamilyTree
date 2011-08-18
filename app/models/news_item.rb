class NewsItem < ActiveRecord::Base
  validates_presence_of :title,:description,:news_date
  has_many :news_uploads,
           :attributes => true,
           :discard_if => proc { |upload| upload.photo_file_size.nil? }
  accepts_nested_attributes_for :news_uploads
end

