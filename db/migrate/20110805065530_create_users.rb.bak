class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string	:email,:null => false
		  t.string  :crypted_password, :null => false # optional, see below
		  t.string 	:password_salt, :null => false  # optional, but highly recommended
		  t.string 	:persistence_token,:null => false # required
		  t.string 	:single_access_token, :null => false # optional, see Authlogic::Session::Params
		  t.string 	:perishable_token,:null => false # optional, see Authlogic::Session::Perishability
		  t.integer :active,:default=>0
			t.integer :is_admin,:default=>DATAENTRYOPERATOR
			t.integer :created_by
      t.timestamps
    end
     @admin = User.create!(:email=>'admin@manekkattil.com',:password=>'12345678',:password_confirmation=>'12345678',:is_admin=>ADMIN)
     @admin.update_attribute('active',User::ACTIVE)

  end

  def self.down
    drop_table :users
  end
end

