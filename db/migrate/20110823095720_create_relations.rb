class CreateRelations < ActiveRecord::Migration
  def self.up
    create_table :relations do |t|
      t.integer :user_id
      t.integer :related_user_id
      t.integer :relation_id
    end
  end

  def self.down
    drop_table :relations
  end
end

