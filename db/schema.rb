# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121203165138) do

  create_table "appointments", :force => true do |t|
    t.integer  "physician_id"
    t.integer  "patient_id"
    t.datetime "appointment_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "appointments", ["patient_id"], :name => "index_appointments_on_patient_id"
  add_index "appointments", ["physician_id"], :name => "index_appointments_on_physician_id"

  create_table "assemblies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "assembly_parts", :force => true do |t|
    t.integer  "assembly_id"
    t.integer  "part_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "assembly_parts", ["assembly_id"], :name => "index_assembly_parts_on_assembly_id"
  add_index "assembly_parts", ["part_id"], :name => "index_assembly_parts_on_part_id"

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.integer  "picture_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "companies", ["picture_id"], :name => "index_companies_on_picture_id"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "phone_mobile"
    t.string   "mailing_address"
    t.string   "email_address"
    t.string   "social_info"
    t.integer  "company_id"
    t.integer  "picture_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "customers", ["company_id"], :name => "index_customers_on_company_id"
  add_index "customers", ["picture_id"], :name => "index_customers_on_picture_id"

  create_table "customers_roles", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "role_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "customers_roles", ["customer_id"], :name => "index_customers_roles_on_customer_id"
  add_index "customers_roles", ["role_id"], :name => "index_customers_roles_on_role_id"

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.integer  "manager_id"
    t.string   "email"
    t.string   "phone"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "employees", ["company_id"], :name => "index_employees_on_company_id"
  add_index "employees", ["manager_id"], :name => "index_employees_on_manager_id"

  create_table "gmap_users", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "location_relations", :force => true do |t|
    t.integer  "loc_from_id"
    t.integer  "loc_to_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "location_relations", ["loc_from_id"], :name => "index_location_relations_on_loc_from_id"
  add_index "location_relations", ["loc_to_id"], :name => "index_location_relations_on_loc_to_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "models", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "models", ["email"], :name => "index_models_on_email", :unique => true
  add_index "models", ["reset_password_token"], :name => "index_models_on_reset_password_token", :unique => true

  create_table "orders", :force => true do |t|
    t.string   "track_no",    :limit => 36
    t.text     "details"
    t.integer  "customer_id"
    t.integer  "employee_id"
    t.date     "order_date"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"

  create_table "orders_products", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "orders_products", ["order_id"], :name => "index_orders_products_on_order_id"
  add_index "orders_products", ["product_id"], :name => "index_orders_products_on_product_id"

  create_table "parts", :force => true do |t|
    t.string   "part_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "physicians", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pictures", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "uuid",           :limit => 36
    t.string   "content_type",   :limit => 16
    t.string   "store_loc",      :limit => 10
    t.string   "store_uri"
    t.binary   "local_data",     :limit => 16777215
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "pictures", ["uuid"], :name => "index_pictures_on_uuid"

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.float    "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
  end

  add_index "user_admins", ["email"], :name => "index_user_admins_on_email", :unique => true
  add_index "user_admins", ["reset_password_token"], :name => "index_user_admins_on_reset_password_token", :unique => true

end
