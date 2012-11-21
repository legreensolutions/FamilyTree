class CreateInterestingLinks < ActiveRecord::Migration
  def self.up
    create_table :interesting_links do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :interesting_links
  end
end
