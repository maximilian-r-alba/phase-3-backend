# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_07_025445) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "subgenre"
    t.string "author"
    t.float "rating"
    t.string "cover_url"
    t.string "summary"
    t.boolean "fiction?"
  end

  create_table "comments", force: :cascade do |t|
    t.string "message"
    t.integer "user_id"
    t.integer "review_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.float "rating"
    t.integer "user_id"
    t.integer "book_id"
    t.string "content"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "avatar_url"
    t.string "bio"
    t.string "username"
    t.string "password"
  end

end
