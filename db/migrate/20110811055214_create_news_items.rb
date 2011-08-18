class CreateNewsItems < ActiveRecord::Migration
  def self.up
    create_table :news_items do |t|
      t.string :title
      t.text :description
      t.date :news_date
      t.boolean :obsolete,:default=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :news_items
  end
end

