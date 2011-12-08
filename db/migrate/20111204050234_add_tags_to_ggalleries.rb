class AddTagsToGgalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries,:tags,:string
  end

  def self.down
    remove_column :galleries,:tags
  end
end

