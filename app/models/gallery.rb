class Gallery < ActiveRecord::Base
  validates_presence_of :title
   #paperclip image upload
  has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }
end

