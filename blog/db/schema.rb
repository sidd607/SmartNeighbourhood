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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151105091447) do

  create_table "authenticates", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "description", limit: 255
    t.integer  "type",        limit: 4
    t.datetime "createdate"
    t.integer  "report",      limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "comments", ["user_id"], name: "fk_rails_03de2dc08c", using: :btree

  create_table "communities", force: :cascade do |t|
    t.string   "pincode",    limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "country",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "polloptions", force: :cascade do |t|
    t.integer  "poll_id",     limit: 4
    t.integer  "option",      limit: 4
    t.string   "description", limit: 255
    t.integer  "votecount",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "polloptions", ["poll_id"], name: "fk_rails_d6a4cadb1d", using: :btree

  create_table "polls", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "post_id",       limit: 4
    t.integer  "interim",       limit: 4
    t.datetime "finish_time"
    t.integer  "anonimity",     limit: 4
    t.integer  "vote_type",     limit: 4
    t.integer  "community_id",  limit: 4
    t.integer  "restricted_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "polls", ["community_id"], name: "fk_rails_eb1a0577c8", using: :btree
  add_index "polls", ["post_id"], name: "fk_rails_b50b782d08", using: :btree
  add_index "polls", ["user_id"], name: "fk_rails_16e77efa22", using: :btree

  create_table "pollusers", force: :cascade do |t|
    t.integer  "poll_id",        limit: 4
    t.integer  "user_id",        limit: 4
    t.integer  "optionSelected", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "pollusers", ["poll_id"], name: "fk_rails_c9a2625e09", using: :btree
  add_index "pollusers", ["user_id"], name: "fk_rails_07c09d4e70", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "community_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.string   "title",        limit: 255
    t.string   "body",         limit: 255
    t.datetime "create_date"
    t.datetime "update_date"
    t.integer  "type",         limit: 4
    t.integer  "priority",     limit: 4
    t.integer  "report",       limit: 4
    t.float    "rating",       limit: 24
    t.integer  "rateCount",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "posts", ["community_id"], name: "fk_rails_e070049175", using: :btree
  add_index "posts", ["user_id"], name: "fk_rails_5b5ddfd518", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "post_id",     limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "rate",        limit: 4
    t.datetime "rated_at"
    t.integer  "type",        limit: 4
    t.string   "Description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "ratings", ["user_id"], name: "fk_rails_a7dfeb9f5f", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "post_id",     limit: 4
    t.integer  "type",        limit: 4
    t.integer  "profile_id",  limit: 4
    t.string   "reason",      limit: 255
    t.datetime "reported_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "reports", ["user_id"], name: "fk_rails_c7699d537d", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "post_id",    limit: 4
    t.integer  "type",       limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstName",    limit: 255
    t.string   "LastName",     limit: 255
    t.string   "gender",       limit: 255
    t.date     "DOB"
    t.string   "phone",        limit: 255
    t.string   "email",        limit: 255
    t.integer  "verified",     limit: 4
    t.integer  "verify_id",    limit: 4
    t.integer  "inactive",     limit: 4
    t.integer  "role_id",      limit: 4
    t.integer  "community_id", limit: 4
    t.integer  "showPhone",    limit: 4
    t.datetime "verifytime"
    t.string   "door_no",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "users", ["community_id"], name: "fk_rails_91a317e2c5", using: :btree
  add_index "users", ["role_id"], name: "fk_rails_642f17018b", using: :btree

  create_table "yellowpages", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.string   "phone",        limit: 255
    t.string   "address",      limit: 255
    t.string   "description",  limit: 255
    t.integer  "verified",     limit: 4
    t.integer  "community_id", limit: 4
    t.float    "AveRating",    limit: 24
    t.integer  "totalRatings", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "yellowpages", ["user_id"], name: "fk_rails_669996509c", using: :btree

  add_foreign_key "comments", "users"
  add_foreign_key "polloptions", "polls"
  add_foreign_key "polls", "communities"
  add_foreign_key "polls", "posts"
  add_foreign_key "polls", "users"
  add_foreign_key "pollusers", "polls"
  add_foreign_key "pollusers", "users"
  add_foreign_key "posts", "communities"
  add_foreign_key "posts", "users"
  add_foreign_key "ratings", "users"
  add_foreign_key "reports", "users"
  add_foreign_key "users", "communities"
  add_foreign_key "users", "roles"
  add_foreign_key "yellowpages", "users"
end
