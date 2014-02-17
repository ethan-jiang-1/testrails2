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

ActiveRecord::Schema.define(:version => 20140217080735) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "alchemy_attachments", :force => true do |t|
    t.string   "name"
    t.string   "file_name"
    t.string   "file_mime_type"
    t.integer  "file_size"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.text     "cached_tag_list"
    t.string   "file_uid"
  end

  add_index "alchemy_attachments", ["file_uid"], :name => "index_alchemy_attachments_on_file_uid"

  create_table "alchemy_cells", :force => true do |t|
    t.integer  "page_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "alchemy_contents", :force => true do |t|
    t.string   "name"
    t.string   "essence_type"
    t.integer  "essence_id"
    t.integer  "element_id"
    t.integer  "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "alchemy_contents", ["element_id", "position"], :name => "index_contents_on_element_id_and_position"

  create_table "alchemy_elements", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "page_id"
    t.boolean  "public",          :default => true
    t.boolean  "folded",          :default => false
    t.boolean  "unique",          :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "cell_id"
    t.text     "cached_tag_list"
  end

  add_index "alchemy_elements", ["page_id", "position"], :name => "index_elements_on_page_id_and_position"

  create_table "alchemy_elements_alchemy_pages", :id => false, :force => true do |t|
    t.integer "element_id"
    t.integer "page_id"
  end

  create_table "alchemy_essence_booleans", :force => true do |t|
    t.boolean  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "alchemy_essence_booleans", ["value"], :name => "index_alchemy_essence_booleans_on_value"

  create_table "alchemy_essence_dates", :force => true do |t|
    t.datetime "date"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "alchemy_essence_files", :force => true do |t|
    t.integer  "attachment_id"
    t.string   "title"
    t.string   "css_class"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "alchemy_essence_htmls", :force => true do |t|
    t.text     "source"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "alchemy_essence_links", :force => true do |t|
    t.string   "link"
    t.string   "link_title"
    t.string   "link_target"
    t.string   "link_class_name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "alchemy_essence_pictures", :force => true do |t|
    t.integer  "picture_id"
    t.string   "caption"
    t.string   "title"
    t.string   "alt_tag"
    t.string   "link"
    t.string   "link_class_name"
    t.string   "link_title"
    t.string   "css_class"
    t.string   "link_target"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "crop_from"
    t.string   "crop_size"
    t.string   "render_size"
  end

  create_table "alchemy_essence_richtexts", :force => true do |t|
    t.text     "body"
    t.text     "stripped_body"
    t.boolean  "do_not_index",  :default => false
    t.boolean  "public"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "alchemy_essence_selects", :force => true do |t|
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "alchemy_essence_selects", ["value"], :name => "index_alchemy_essence_selects_on_value"

  create_table "alchemy_essence_texts", :force => true do |t|
    t.text     "body"
    t.string   "link"
    t.string   "link_title"
    t.string   "link_class_name"
    t.boolean  "public",          :default => false
    t.boolean  "do_not_index",    :default => false
    t.string   "link_target"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "alchemy_folded_pages", :force => true do |t|
    t.integer "page_id"
    t.integer "user_id"
    t.boolean "folded",  :default => false
  end

  create_table "alchemy_languages", :force => true do |t|
    t.string   "name"
    t.string   "language_code"
    t.string   "frontpage_name"
    t.string   "page_layout",    :default => "intro"
    t.boolean  "public",         :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.boolean  "default",        :default => false
    t.string   "country_code",   :default => "",      :null => false
    t.integer  "site_id"
  end

  add_index "alchemy_languages", ["language_code", "country_code"], :name => "index_alchemy_languages_on_language_code_and_country_code"
  add_index "alchemy_languages", ["language_code"], :name => "index_alchemy_languages_on_language_code"
  add_index "alchemy_languages", ["site_id"], :name => "index_alchemy_languages_on_site_id"

  create_table "alchemy_legacy_page_urls", :force => true do |t|
    t.string   "urlname",    :null => false
    t.integer  "page_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "alchemy_legacy_page_urls", ["urlname"], :name => "index_alchemy_legacy_page_urls_on_urlname"

  create_table "alchemy_pages", :force => true do |t|
    t.string   "name"
    t.string   "urlname"
    t.string   "title"
    t.string   "language_code"
    t.boolean  "language_root"
    t.string   "page_layout"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "parent_id"
    t.integer  "depth"
    t.boolean  "visible",          :default => false
    t.boolean  "public",           :default => false
    t.boolean  "locked",           :default => false
    t.integer  "locked_by"
    t.boolean  "restricted",       :default => false
    t.boolean  "robot_index",      :default => true
    t.boolean  "robot_follow",     :default => true
    t.boolean  "sitemap",          :default => true
    t.boolean  "layoutpage",       :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "language_id"
    t.text     "cached_tag_list"
  end

  add_index "alchemy_pages", ["language_id"], :name => "index_pages_on_language_id"
  add_index "alchemy_pages", ["parent_id", "lft"], :name => "index_pages_on_parent_id_and_lft"
  add_index "alchemy_pages", ["urlname"], :name => "index_pages_on_urlname"

  create_table "alchemy_pictures", :force => true do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.integer  "image_file_width"
    t.integer  "image_file_height"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "upload_hash"
    t.text     "cached_tag_list"
    t.string   "image_file_uid"
    t.integer  "image_file_size"
  end

  create_table "alchemy_sites", :force => true do |t|
    t.string   "host"
    t.string   "name"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.boolean  "public",                   :default => false
    t.text     "aliases"
    t.boolean  "redirect_to_primary_host"
  end

  add_index "alchemy_sites", ["host", "public"], :name => "alchemy_sites_public_hosts_idx"
  add_index "alchemy_sites", ["host"], :name => "index_alchemy_sites_on_host"

  create_table "alchemy_users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "login"
    t.string   "email"
    t.string   "gender"
    t.string   "roles",                                 :default => "registered"
    t.string   "language"
    t.string   "encrypted_password",     :limit => 128, :default => "",           :null => false
    t.string   "password_salt",          :limit => 128, :default => "",           :null => false
    t.integer  "sign_in_count",                         :default => 0,            :null => false
    t.integer  "failed_attempts",                       :default => 0,            :null => false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.text     "cached_tag_list"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
  end

  add_index "alchemy_users", ["email"], :name => "index_alchemy_users_on_email", :unique => true
  add_index "alchemy_users", ["login"], :name => "index_alchemy_users_on_login", :unique => true
  add_index "alchemy_users", ["reset_password_token"], :name => "index_alchemy_users_on_reset_password_token", :unique => true
  add_index "alchemy_users", ["roles"], :name => "index_alchemy_users_on_roles"

  create_table "appointments", :force => true do |t|
    t.integer  "physician_id"
    t.integer  "patient_id"
    t.datetime "appointment_date"
  end

  add_index "appointments", ["patient_id"], :name => "index_appointments_on_patient_id"
  add_index "appointments", ["physician_id"], :name => "index_appointments_on_physician_id"

  create_table "assemblies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "assembly_parts", :force => true do |t|
    t.integer "assembly_id"
    t.integer "part_id"
  end

  add_index "assembly_parts", ["assembly_id"], :name => "index_assembly_parts_on_assembly_id"
  add_index "assembly_parts", ["part_id"], :name => "index_assembly_parts_on_part_id"

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.text     "modifications"
    t.string   "action"
    t.string   "tag"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "audits", ["action"], :name => "index_audits_on_action"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["tag"], :name => "index_audits_on_tag"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "booking_state_transitions", :force => true do |t|
    t.integer  "booking_id"
    t.integer  "user_id"
    t.string   "event"
    t.string   "from"
    t.string   "to"
    t.string   "state_message"
    t.datetime "created_at"
  end

  add_index "booking_state_transitions", ["booking_id"], :name => "index_booking_state_transitions_on_booking_id"

  create_table "bookings", :force => true do |t|
    t.string   "what"
    t.string   "state"
    t.string   "state_message"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "cms_blocks", :force => true do |t|
    t.integer  "page_id",                        :null => false
    t.string   "identifier",                     :null => false
    t.text     "content",    :limit => 16777215
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "cms_blocks", ["page_id", "identifier"], :name => "index_cms_blocks_on_page_id_and_identifier"

  create_table "cms_categories", :force => true do |t|
    t.integer "site_id",          :null => false
    t.string  "label",            :null => false
    t.string  "categorized_type", :null => false
  end

  add_index "cms_categories", ["site_id", "categorized_type", "label"], :name => "index_cms_categories_on_site_id_and_categorized_type_and_label", :unique => true

  create_table "cms_categorizations", :force => true do |t|
    t.integer "category_id",      :null => false
    t.string  "categorized_type", :null => false
    t.integer "categorized_id",   :null => false
  end

  add_index "cms_categorizations", ["category_id", "categorized_type", "categorized_id"], :name => "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", :unique => true

  create_table "cms_files", :force => true do |t|
    t.integer  "site_id",                                          :null => false
    t.integer  "block_id"
    t.string   "label",                                            :null => false
    t.string   "file_file_name",                                   :null => false
    t.string   "file_content_type",                                :null => false
    t.integer  "file_file_size",                                   :null => false
    t.string   "description",       :limit => 2048
    t.integer  "position",                          :default => 0, :null => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "cms_files", ["site_id", "block_id"], :name => "index_cms_files_on_site_id_and_block_id"
  add_index "cms_files", ["site_id", "file_file_name"], :name => "index_cms_files_on_site_id_and_file_file_name"
  add_index "cms_files", ["site_id", "label"], :name => "index_cms_files_on_site_id_and_label"
  add_index "cms_files", ["site_id", "position"], :name => "index_cms_files_on_site_id_and_position"

  create_table "cms_layouts", :force => true do |t|
    t.integer  "site_id",                                           :null => false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                                             :null => false
    t.string   "identifier",                                        :null => false
    t.text     "content",    :limit => 16777215
    t.text     "css",        :limit => 16777215
    t.text     "js",         :limit => 16777215
    t.integer  "position",                       :default => 0,     :null => false
    t.boolean  "is_shared",                      :default => false, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "cms_layouts", ["parent_id", "position"], :name => "index_cms_layouts_on_parent_id_and_position"
  add_index "cms_layouts", ["site_id", "identifier"], :name => "index_cms_layouts_on_site_id_and_identifier", :unique => true

  create_table "cms_pages", :force => true do |t|
    t.integer  "site_id",                                               :null => false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                                                 :null => false
    t.string   "slug"
    t.string   "full_path",                                             :null => false
    t.text     "content",        :limit => 16777215
    t.integer  "position",                           :default => 0,     :null => false
    t.integer  "children_count",                     :default => 0,     :null => false
    t.boolean  "is_published",                       :default => true,  :null => false
    t.boolean  "is_shared",                          :default => false, :null => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "cms_pages", ["parent_id", "position"], :name => "index_cms_pages_on_parent_id_and_position"
  add_index "cms_pages", ["site_id", "full_path"], :name => "index_cms_pages_on_site_id_and_full_path"

  create_table "cms_revisions", :force => true do |t|
    t.string   "record_type",                     :null => false
    t.integer  "record_id",                       :null => false
    t.text     "data",        :limit => 16777215
    t.datetime "created_at"
  end

  add_index "cms_revisions", ["record_type", "record_id", "created_at"], :name => "index_cms_revisions_on_record_type_and_record_id_and_created_at"

  create_table "cms_sites", :force => true do |t|
    t.string  "label",                          :null => false
    t.string  "identifier",                     :null => false
    t.string  "hostname",                       :null => false
    t.string  "path"
    t.string  "locale",      :default => "en",  :null => false
    t.boolean "is_mirrored", :default => false, :null => false
  end

  add_index "cms_sites", ["hostname"], :name => "index_cms_sites_on_hostname"
  add_index "cms_sites", ["is_mirrored"], :name => "index_cms_sites_on_is_mirrored"

  create_table "cms_snippets", :force => true do |t|
    t.integer  "site_id",                                           :null => false
    t.string   "label",                                             :null => false
    t.string   "identifier",                                        :null => false
    t.text     "content",    :limit => 16777215
    t.integer  "position",                       :default => 0,     :null => false
    t.boolean  "is_shared",                      :default => false, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "cms_snippets", ["site_id", "identifier"], :name => "index_cms_snippets_on_site_id_and_identifier", :unique => true
  add_index "cms_snippets", ["site_id", "position"], :name => "index_cms_snippets_on_site_id_and_position"

  create_table "companies", :force => true do |t|
    t.string  "name"
    t.integer "location_id"
    t.integer "picture_id"
  end

  add_index "companies", ["picture_id"], :name => "index_companies_on_picture_id"

  create_table "currency_numbers", :force => true do |t|
    t.float    "float1"
    t.float    "float2"
    t.decimal  "decimal1",   :precision => 10, :scale => 2
    t.decimal  "decimal2",   :precision => 10, :scale => 2
    t.integer  "integer1"
    t.integer  "integer2"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

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
    t.integer "customer_id"
    t.integer "role_id"
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

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "hidden_name"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.text     "description"
    t.decimal  "entrance_fee", :precision => 6, :scale => 2
    t.boolean  "published"
    t.integer  "location_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

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
    t.integer "loc_from_id"
    t.integer "loc_to_id"
  end

  add_index "location_relations", ["loc_from_id"], :name => "index_location_relations_on_loc_from_id"
  add_index "location_relations", ["loc_to_id"], :name => "index_location_relations_on_loc_to_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "offer_state_transitions", :force => true do |t|
    t.integer  "offer_id"
    t.integer  "user_id"
    t.string   "event"
    t.string   "from"
    t.string   "to"
    t.string   "state_message"
    t.datetime "created_at"
  end

  add_index "offer_state_transitions", ["offer_id"], :name => "index_offer_state_transitions_on_offer_id"

  create_table "offers", :force => true do |t|
    t.string   "name"
    t.string   "state"
    t.string   "state_message"
    t.integer  "price_per_night"
    t.integer  "price_from_mmc"
    t.integer  "price_from_opr"
    t.string   "comment"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

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
    t.integer "order_id"
    t.integer "product_id"
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

  create_table "post_comments", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts_post_comments", :force => true do |t|
    t.integer "post_id"
    t.integer "post_comment_id"
  end

  add_index "posts_post_comments", ["post_comment_id"], :name => "index_posts_post_comments_on_post_comment_id"
  add_index "posts_post_comments", ["post_id"], :name => "index_posts_post_comments_on_post_id"

  create_table "price_model1s", :force => true do |t|
    t.integer  "price1"
    t.integer  "price2"
    t.integer  "price3"
    t.integer  "price4"
    t.integer  "price5"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "price_model2s", :force => true do |t|
    t.integer  "priceA"
    t.integer  "priceB"
    t.integer  "priceC"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "price_model3s", :force => true do |t|
    t.integer  "priceX"
    t.integer  "priceY"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "prices", :force => true do |t|
    t.integer  "heir_id"
    t.string   "heir_type"
    t.integer  "base_price"
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

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "course"
    t.integer  "duratoin"
    t.string   "day_job"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
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

  create_table "users", :force => true do |t|
    t.string   "name"
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

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
