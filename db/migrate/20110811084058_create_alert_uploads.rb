class CreateAlertUploads < ActiveRecord::Migration
  def self.up
    create_table :alert_uploads do |t|
      t.integer :alert_id
      t.string :photo_file_name
      t.integer :photo_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :alert_uploads
  end
end

