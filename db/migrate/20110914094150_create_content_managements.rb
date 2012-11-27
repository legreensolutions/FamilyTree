class CreateContentManagements < ActiveRecord::Migration
  def self.up
    create_table :content_managements do |t|
      t.string :page,:null=>false
      t.string :identification,:null=>false
      t.integer :no_of_chars,:null=>false
      t.string :description,:null=>false
      t.timestamps
    end
   ContentManagement.create!(:page => "HOME", :identification => "HOME", :no_of_chars => 100, :description => "HOME")
            ContentManagement.create!(:page => "COMMITTEE", :identification => "COMMITTEE", :no_of_chars => 100, :description => "COMMITTEE")
            ContentManagement.create!(:page => "CONTACT US", :identification => "CONTACT US", :no_of_chars => 100, :description => "CONTACT US")
            ContentManagement.create!(:page => "GUIDELINES", :identification => "GUIDELINES", :no_of_chars =>100 , :description => "GUIDELINES")
  end

  def self.down
    drop_table :content_managements
  end
end

