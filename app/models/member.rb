class Member < ActiveRecord::Base
  belongs_to :user,:dependent=>:destroy
  belongs_to :family
  belongs_to :country
  belongs_to :state
  belongs_to :district
  validates_presence_of :name
  validates_presence_of :gender_id
  belongs_to :post


  has_many :child_member_relations, :class_name => "Relation", :foreign_key => "user_id"
  has_many :parent_member_relations, :class_name => "Relation", :foreign_key => "related_user_id"

  has_many :child_members, :through => :parent_member_relations
  has_many :parent_members, :through => :child_member_relations

  has_one :father, :through => :child_member_relations, :source => :parent_member, :conditions => ["(relation_id = ? and gender_id = ?)", '1', MALE]
  has_one :mother, :through => :child_member_relations, :source => :parent_member, :conditions => ["(relation_id = ? and gender_id = ?)", '1', FEMALE]

  has_many :sons, :through => :parent_member_relations, :source => :child_member, :conditions => ["(relation_id = ? and gender_id = ?)", '1', MALE]
  has_many :daughters, :through => :parent_member_relations, :source => :child_member, :conditions => ["(relation_id = ? and gender_id = ?)", '1', FEMALE]




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


  def find_siblings_or_childerens(relation)
    @relation = ""
    @member = ""
    @relation = Relation.find(:all,:conditions=>['user_id = ? and relation_id = ?',self.id,relation])
    return @relation unless @relation.blank?
    return nil
  end


  def find_father_or_mother(gender)
    @relation = ""
    @member = ""
    @relations = Relation.find(:all,:conditions=>['user_id = ? and relation_id = ?',self.id,PARENT])
    for relation in @relations
      @member = Member.find_by_id_and_gender_id(relation.related_user_id,gender) unless relation.nil?
      if @member
        break;
      end
    end
    return @member unless @member.blank?
    return nil
  end

  def find_childrens
    @relations = ""
    @relations = Relation.find(:all,:conditions=>['related_user_id = ? and relation_id = ?',self.id,PARENT])
    return @relations unless @relations.blank?
    return nil
  end

  def find_brothers_or_sisters
    @relation = ""
    @relation = Relation.find(:first,:conditions=>['user_id = ? and relation_id = ?',self.id,PARENT])
    @relations = Relation.find(:all,:conditions=>['related_user_id = ? and relation_id = ? and user_id != ?',@relation.related_user_id,PARENT,self.id]) unless @relation.blank?
    return @relations unless @relations.blank?
    return nil
  end


  def find_spouse
    @relation = ""
    @relation = Relation.find(:first,:conditions=>['user_id = ? and relation_id = ?',self.id,SPOUSE])
    @member = Member.find_by_id(@relation.related_user_id) unless @relation.nil?
    return @member unless @member.blank?
    return nil
  end

end

