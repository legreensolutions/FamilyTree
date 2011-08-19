class Family < ActiveRecord::Base
  has_many :members
  validates_presence_of :name
   #paperclip image upload
  has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }
end

