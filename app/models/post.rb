class Post < ActiveRecord::Base

  #has_many :members
  has_many :committee_members
  has_many :members, :through => :committee_members

end

