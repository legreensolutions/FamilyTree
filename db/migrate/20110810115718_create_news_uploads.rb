class CreateNewsUploads < ActiveRecord::Migration
  def self.up
    create_table :news_uploads do |t|
      t.integer :news_item_id
      t.string :photo_file_name
      t.integer :photo_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :news_uploads
  end
end

