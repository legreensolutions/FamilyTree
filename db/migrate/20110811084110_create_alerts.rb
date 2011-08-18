class CreateAlerts < ActiveRecord::Migration
  def self.up
    create_table :alerts do |t|
      t.string :title
      t.text :description
      t.date :alert_date
      t.boolean :obsolete,:default=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :alerts
  end
end

