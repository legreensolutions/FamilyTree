class Gallery < ActiveRecord::Base
  HUMANIZED_ATTRIBUTES = {
:title => "Title",
:photo_file_name=>'Image'
}

def self.human_attribute_name(attr)
HUMANIZED_ATTRIBUTES[attr.to_sym] || super
end
  validates_presence_of :title
   #paperclip image upload

  has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150",
      :medium =>"300",
      :large => "600"
       },
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"



validates_attachment_presence :photo
attr_accessible  :title, :user_id, :description, :tags, :photo, :public
end

