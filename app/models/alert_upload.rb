class AlertUpload < ActiveRecord::Base
  belongs_to :alert
  has_attached_file :photo,
                    :styles => {
                      :thumb => ["100x100", :jpg],
                      :small => ["200x200", :jpg],
                    },
                    :default_style => :small,
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"

end

