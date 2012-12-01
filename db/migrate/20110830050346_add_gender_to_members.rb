class AddGenderToMembers < ActiveRecord::Migration
  def self.up
    add_column :members,:gender_id,:integer

      Member.delete_all
      Member.create!(:name =>"admin", :email =>"admin@manekkattil.com", :user_id => 1, :gender_id => 1)


  end

  def self.down
    remove_column :members,:gender_id
  end
end

