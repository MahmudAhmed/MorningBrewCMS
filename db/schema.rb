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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_19_000437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "newsletters", force: :cascade do |t|
    t.string "date"
    t.text "html"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_newsletters_on_date", unique: true
  end

  create_table "stories", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.string "tag", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author", default: "Mahmud Ahmed"
    t.string "lyraID"
    t.integer "newsletter_id"
    t.index ["tag"], name: "index_stories_on_tag"
    t.index ["title"], name: "index_stories_on_title", unique: true
  end

end