class AddDisplayOnHomePageAndTagsToNews < ActiveRecord::Migration
  def self.up
    add_column :news_items,:tags,:string
    add_column :news_items,:display_on_home_page,:boolean,:default=>false
  end

  def self.down
    remove_column :news_items,:tags
    remove_column :news_items,:display_on_home_page
  end
end

