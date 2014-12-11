class Relation < ActiveRecord::Base
attr_accessible  :user_id, :related_user_id, :relation_id
 belongs_to :child_member, :class_name => "Member", :foreign_key => "user_id"
 belongs_to :parent_member, :class_name => "Member", :foreign_key => "related_user_id"


#related_user_id => new member_id
#user_id => my id
 def self.add_parent_relationship(my_self,user_id,related_user_id)
     Relation.create(:user_id=>user_id,:related_user_id=>related_user_id,:relation_id=>PARENT) if Relation.find_by_user_id_and_relation_id(related_user_id,PARENT).blank?
     
   #my_parents
   #@relations = Relation.find(:all,:conditions=>['user_id = ? and relation_id = ?',user_id,PARENT])
   @relations = my_self.child_member_relations.find(:all,:conditions=>['relation_id = ?',PARENT])





    my_parents = []
    my_siblings = []
    unless @relations.blank?
        @relations.each do |relation|
        my_parents << relation.related_user_id
        #my_siblings
        @my_siblings = Relation.find(:all,:conditions=>['related_user_id = ? and relation_id = ? and user_id != ?',relation.related_user_id,PARENT,user_id]) unless relation.blank?
        unless @my_siblings.blank?
            @my_siblings.each do |sibling|
              my_siblings << sibling.user_id
            end
        end
      end
    end

  # add my parents as my sibling's parent also
    my_parents.each do |parent|
      my_siblings.each do |sibling|
        Relation.create(:user_id=>sibling,:related_user_id=>parent,:relation_id=>PARENT) if
        Relation.find_by_user_id_and_related_user_id_and_relation_id(sibling,parent,PARENT).blank?
      end
    end

  #add spouse relation of my parents
   if !my_parents.blank? and my_parents.count > 1
      Relation.create(:user_id=>my_parents[0],:related_user_id=>my_parents[1],:relation_id=>SPOUSE) if Relation.find_by_user_id_and_related_user_id_and_relation_id(my_parents[0],my_parents[1],SPOUSE).blank?
       Relation.create(:user_id=>my_parents[1],:related_user_id=>my_parents[0],:relation_id=>SPOUSE) if Relation.find_by_user_id_and_related_user_id_and_relation_id(my_parents[1],my_parents[0],SPOUSE).blank?
    end

end




def  self.add_spouse_relationship(my_self,user_id,related_user_id)
    Relation.create(:user_id=>related_user_id,:related_user_id=>user_id,:relation_id=>SPOUSE) if Relation.find_by_user_id_and_relation_id_and_related_user_id(related_user_id,SPOUSE,user_id).blank?
       #my_children
       @my_children = my_self.parent_member_relations.find(:all,:conditions=>['relation_id = ?',PARENT])
       logger.debug ".............xxx Going to find children"
       unless @my_children.blank?
         @my_children.each do |children|
           logger.debug "Adding Children ............xxx "
           Relation.create(:user_id=>children.user_id,:related_user_id=>related_user_id,:relation_id=>PARENT) if Relation.find_by_user_id_and_related_user_id_and_relation_id(children.user_id,related_user_id,PARENT).blank?
         end
       end
        Relation.create(:user_id=>user_id,:related_user_id=>related_user_id,:relation_id=>SPOUSE) if Relation.find_by_user_id_and_relation_id_and_related_user_id(user_id,SPOUSE,related_user_id).blank?
  end


   def self.add_sibling_relationship(my_self,user_id,related_user_id)
     @my_parents = my_self.child_member_relations.find(:all,:conditions=>['relation_id = ?',PARENT])
      unless @my_parents.blank?
        @my_parents.each do |parent|
        Relation.create(:user_id=>related_user_id,:related_user_id=>parent.related_user_id,:relation_id=>PARENT) if Relation.find_by_user_id_and_relation_id_and_related_user_id(related_user_id,PARENT,parent.related_user_id).blank?
        end
      end
  end

    def self.add_children_relationship(user_id,related_user_id)
     Relation.create(:user_id=>related_user_id,:related_user_id=>user_id,:relation_id=>PARENT) if Relation.find_by_user_id_and_relation_id(related_user_id,PARENT).blank?
      @relation = Relation.find_by_related_user_id_and_relation_id(user_id,SPOUSE)
      if @relation
         Relation.create(:user_id=>related_user_id,:related_user_id=>@relation.user_id,:relation_id=>PARENT) if Relation.find_by_user_id_and_relation_id_and_related_user_id(user_id,PARENT,@relation.user_id).blank?
      end
  end


end

