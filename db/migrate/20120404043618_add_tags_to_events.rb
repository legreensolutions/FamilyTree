class AddTagsToEvents < ActiveRecord::Migration
  def self.up
     add_column :events,:tags,:string
  end

  def self.down
    remove_column :events,:tags
  end
end

