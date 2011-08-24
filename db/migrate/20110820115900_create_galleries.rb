class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.string :title,:null=>false
      t.string :description
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.boolean :public,:default=>true
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end

