# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110805125543) do

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                   :null => false
    t.string   "email",                                  :null => false
    t.string   "pet_name"
    t.integer  "phone"
    t.integer  "mobile"
    t.integer  "family_name_id"
    t.string   "house_name"
    t.string   "house_number"
    t.string   "street"
    t.string   "place"
    t.integer  "pin"
    t.integer  "district_id"
    t.integer  "state_id"
    t.integer  "country_id"
    t.boolean  "demoted",             :default => false
    t.boolean  "lock",                :default => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.string   "perishable_token",                       :null => false
    t.integer  "active",              :default => 0
    t.boolean  "is_admin",            :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
