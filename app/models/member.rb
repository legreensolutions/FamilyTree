class Member < ActiveRecord::Base
  belongs_to :user,:dependent=>:destroy
  belongs_to :family
  belongs_to :country
  belongs_to :state
  belongs_to :district
  validates_presence_of :name
  validates_presence_of :email
  #paperclip image upload
  has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }
end

