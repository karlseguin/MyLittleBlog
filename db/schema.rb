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

ActiveRecord::Schema.define(:version => 20100609223704) do

  create_table "categories", :force => true do |t|
    t.string "name"
  end

  create_table "posts", :force => true do |t|
    t.string   "slug",        :limit => 50,  :null => false
    t.string   "title",       :limit => 125, :null => false
    t.string   "summary",     :limit => 600, :null => false
    t.text     "body",                       :null => false
    t.integer  "category_id",                :null => false
    t.datetime "created_at"
  end

  add_index "posts", ["created_at", "category_id"], :name => "index_posts_on_created_at_and_category_id", :unique => true
  add_index "posts", ["slug"], :name => "index_posts_on_slug", :unique => true

end
