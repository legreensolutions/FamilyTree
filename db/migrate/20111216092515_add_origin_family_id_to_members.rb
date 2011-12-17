class AddOriginFamilyIdToMembers < ActiveRecord::Migration
  def self.up
    add_column :members,:origin_family_id,:integer
  end

  def self.down
     remove_column :members,:origin_family_id
  end
end

