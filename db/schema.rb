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

ActiveRecord::Schema.define(:version => 20120104175352) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "subtitle"
    t.integer  "sector"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "file_uploads", :force => true do |t|
    t.string   "name"
    t.text     "caption"
    t.integer  "uploadable_id"
    t.string   "uploadable_type"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_num"
  end

  create_table "home_pages", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_order"
  end

  create_table "news_items", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.date     "published_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "news_type"
    t.boolean  "important"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.integer  "order"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pageable_id"
    t.string   "pageable_type"
  end

  create_table "projects", :force => true do |t|
    t.integer  "project_type"
    t.integer  "area"
    t.string   "city"
    t.string   "province"
    t.string   "completion_date"
    t.boolean  "is_renowned"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "client_name"
    t.string   "costs"
    t.string   "name"
    t.text     "description"
  end

  create_table "services", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
