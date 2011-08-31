class Relation < ActiveRecord::Base

 belongs_to :child_member, :class_name => "Member", :foreign_key => "user_id"
 belongs_to :parent_member, :class_name => "Member", :foreign_key => "related_user_id"

end

