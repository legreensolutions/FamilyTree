class CreateContentManagements < ActiveRecord::Migration
  def self.up
    create_table :content_managements do |t|
      t.string :page,:null=>false
      t.string :identification,:null=>false
      t.integer :no_of_chars,:null=>false
      t.string :description,:null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :content_managements
  end
end

