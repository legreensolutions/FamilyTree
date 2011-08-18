class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string    :name,               :null => false
      t.string    :email,               :null => false
      t.string    :pet_name
      t.integer   :phone
      t.integer   :mobile
      t.references   :family
      t.string    :house_name
      t.string    :house_number
      t.string    :street
      t.string    :place
      t.integer   :pin
      t.references :district
      t.references :state
      t.references :country
      t.boolean    :demoted,:default=>false
      t.boolean    :lock,:default=>false
      t.string     :photo_file_name
      t.string     :photo_content_type
      t.integer    :photo_file_size
      t.integer    :created_by,:default=>User::ADMIN
      t.integer    :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end

