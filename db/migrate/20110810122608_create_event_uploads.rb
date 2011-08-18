class CreateEventUploads < ActiveRecord::Migration
  def self.up
    create_table :event_uploads do |t|
      t.integer :event_id
      t.string :photo_file_name
      t.integer :photo_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :event_uploads
  end
end

