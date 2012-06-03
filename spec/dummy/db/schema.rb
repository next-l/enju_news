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

ActiveRecord::Schema.define(:version => 20111201163718) do

  create_table "library_groups", :force => true do |t|
    t.string   "name",                                               :null => false
    t.text     "display_name"
    t.string   "short_name",                                         :null => false
    t.string   "email"
    t.text     "my_networks"
    t.boolean  "use_dsbl",     :default => false,                    :null => false
    t.text     "dsbl_list"
    t.text     "login_banner"
    t.text     "note"
    t.integer  "country_id"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "url",          :default => "http://localhost:3000/"
  end

  add_index "library_groups", ["short_name"], :name => "index_library_groups_on_short_name"

  create_table "news_feeds", :force => true do |t|
    t.integer  "library_group_id", :default => 1, :null => false
    t.string   "title"
    t.string   "url"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "news_posts", :force => true do |t|
    t.text     "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "required_role_id", :default => 1,     :null => false
    t.text     "note"
    t.integer  "position"
    t.boolean  "draft",            :default => false, :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "url"
  end

  add_index "news_posts", ["user_id"], :name => "index_news_posts_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "user_groups", :force => true do |t|
    t.string   "name"
    t.string   "string"
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.datetime "deleted_at"
    t.integer  "valid_period_for_new_user", :default => 0, :null => false
    t.datetime "expired_at"
  end

  create_table "user_has_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "user_group_id"
    t.integer  "required_role_id"
    t.string   "username"
    t.text     "note"
    t.string   "locale"
    t.string   "user_number"
    t.integer  "library_id"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
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
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
