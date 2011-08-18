class NewsItem < ActiveRecord::Base
  has_many :news_uploads,
           :attributes => true,
           :discard_if => proc { |upload| upload.photo_file_size.nil? }
  accepts_nested_attributes_for :news_uploads
end

