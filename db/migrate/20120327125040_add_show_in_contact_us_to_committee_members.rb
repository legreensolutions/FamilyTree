class AddShowInContactUsToCommitteeMembers < ActiveRecord::Migration
  def self.up
    add_column :committee_members,:show_in_contact_us,:boolean,:default=>false
  end

  def self.down
    remove_column :committee_members,:show_in_contact_us
  end
end

