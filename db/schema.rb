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

ActiveRecord::Schema.define(:version => 20140521155443) do

  create_table "games", :force => true do |t|
    t.integer  "player1"
    t.integer  "player2"
    t.string   "winner"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "moves_no"
    t.string   "player1_sign"
    t.string   "player2_sign"
  end

  create_table "moves", :force => true do |t|
    t.string   "column"
    t.string   "row"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "game_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "email"
    t.string   "age"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

end
