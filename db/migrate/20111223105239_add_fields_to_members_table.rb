class AddFieldsToMembersTable < ActiveRecord::Migration
  def self.up
    add_column :members,:dob,:date
    add_column :members,:marriage_date,:date
    add_column :members,:parish,:string
    add_column :members,:occupation,:string
    add_column :members,:position,:string
    add_column :members,:official_address,:string
    add_column :members,:diseased,:boolean,:default=>false
  end

  def self.down
    remove_column :members,:dob
    remove_column :members,:marriage_date
    remove_column :members,:parish
    remove_column :members,:occupation
    remove_column :members,:position
    remove_column :members,:official_address
    remove_column :members,:diseased
  end
end

