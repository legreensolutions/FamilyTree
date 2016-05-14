class AddUserIdToEvents < ActiveRecord::Migration
  def self.up
      add_column :events,:user_id,:integer
      add_column :events,:tags,:string
      add_column :news_items,:user_id,:integer

  end

  def self.down
   remove_column :events,:user_id
   remove_column :news_items,:user_id
  end
end

