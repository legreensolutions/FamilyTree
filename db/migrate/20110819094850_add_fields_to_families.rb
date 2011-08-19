class AddFieldsToFamilies < ActiveRecord::Migration
  def self.up
      add_column :families,:short_description,:string
      add_column :families,:long_description,:string
      add_column :families,:photo_file_name,:string
      add_column :families,:photo_content_type,:string
      add_column :families,:photo_file_size,:integer

  end

  def self.down
    remove_column :families,:short_description
    remove_column :families,:long_description
    remove_column :families,:photo_file_name
    remove_column :families,:photo_content_type
    remove_column :families,:photo_file_size

  end
end

