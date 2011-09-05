class AddPostIdToMembers < ActiveRecord::Migration
  def self.up
    add_column :members,:post_id,:integer
  end

  def self.down
    remove_column :members,:post_id,:integer
  end
end

