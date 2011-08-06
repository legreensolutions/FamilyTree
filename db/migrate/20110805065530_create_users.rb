class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :name,               :null => false
      t.string    :email,               :null => false
      t.string    :pet_name
      t.integer   :phone
      t.integer   :mobile
      t.integer   :family_name_id
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
      t.string    :crypted_password,    :null => false
      t.string    :password_salt,       :null => false
      t.string    :persistence_token,   :null => false
      t.string    :single_access_token, :null => false
      t.string    :perishable_token,    :null => false
      t.integer :active,:default=>0
			t.boolean :is_admin,:default=>false
      t.timestamps
    end
     @admin = User.create!(:name=>'admin',:email=>'admin@manekkattil.com',:password=>'12345678',:password_confirmation=>'12345678',:is_admin=>true)
     @admin.update_attribute('active',1)

  end

  def self.down
    drop_table :users
  end
end

