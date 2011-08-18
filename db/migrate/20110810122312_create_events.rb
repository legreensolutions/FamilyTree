class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date  :event_date
      t.boolean :obsolete,:default=>false
      t.timestamps
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

