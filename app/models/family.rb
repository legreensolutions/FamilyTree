class Family < ActiveRecord::Base
  has_many :members
  validates_presence_of :name

  attr_accessible :name, :short_description, :long_description, :photo 
   #paperclip image upload
  has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" },
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"
end

