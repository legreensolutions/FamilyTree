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


   def find_relation(relation)
     @relation = ""
     @member = ""
    @relation = Relation.find(:first,:conditions=>['user_id = ? and relation_id = ?',self.id,relation])
    @member = Member.find_by_id(@relation.related_user_id) unless @relation.nil?
    return @member unless @member.blank?
    return nil
  end
end

