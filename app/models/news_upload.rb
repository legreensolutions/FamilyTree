class NewsUpload < ActiveRecord::Base
  belongs_to :news_item
  has_attached_file :photo,
                    :styles => {
                      :thumb => ["100x100", :jpg],
                      :small => ["300x300", :jpg],
                    },
                    :default_style => :small,
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"

end

