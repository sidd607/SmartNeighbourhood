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

ActiveRecord::Schema.define(version: 20151129221948) do

  create_table "comments", force: :cascade do |t|
    t.integer  "profile_id",  limit: 4
    t.string   "description", limit: 255
    t.datetime "createdate"
    t.integer  "report",      limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "post_id",     limit: 4
    t.integer  "data_type",   limit: 4
  end

  add_index "comments", ["profile_id"], name: "fk_rails_f1b0e5bff7", using: :btree

  create_table "communities", force: :cascade do |t|
    t.string   "pincode",    limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "country",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "created_by",        limit: 4
    t.integer  "responded_by",      limit: 4
    t.integer  "post_id",           limit: 4
    t.integer  "view_stat",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "notification_type", limit: 4
    t.string   "message",           limit: 255
  end

  create_table "polls", force: :cascade do |t|
    t.integer  "profile_id",    limit: 4
    t.integer  "post_id",       limit: 4
    t.text     "options",       limit: 65535
    t.text     "user_response", limit: 65535
    t.integer  "interim",       limit: 4
    t.datetime "finish_time"
    t.integer  "anonimity",     limit: 4
    t.integer  "vote_type",     limit: 4
    t.integer  "community_id",  limit: 4
    t.integer  "restricted_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "polls", ["community_id"], name: "fk_rails_eb1a0577c8", using: :btree
  add_index "polls", ["post_id"], name: "fk_rails_b50b782d08", using: :btree
  add_index "polls", ["profile_id"], name: "fk_rails_3c2699afab", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "community_id", limit: 4
    t.integer  "profile_id",   limit: 4
    t.string   "title",        limit: 255
    t.string   "body",         limit: 255
    t.datetime "create_date"
    t.datetime "update_date"
    t.integer  "priority",     limit: 4
    t.integer  "report",       limit: 4
    t.float    "rating",       limit: 24
    t.integer  "rateCount",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "data_type",    limit: 4
  end

  add_index "posts", ["community_id"], name: "fk_rails_e070049175", using: :btree
  add_index "posts", ["profile_id"], name: "fk_rails_cd61a4aa45", using: :btree

  create_table "profiles", force: :cascade do |t|
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

  add_index "profiles", ["community_id"], name: "fk_rails_ee594be71a", using: :btree
  add_index "profiles", ["role_id"], name: "fk_rails_dd83ee4c4e", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "post_id",     limit: 4
    t.integer  "profile_id",  limit: 4
    t.integer  "rate",        limit: 4
    t.datetime "rated_at"
    t.integer  "type",        limit: 4
    t.string   "Description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "ratings", ["profile_id"], name: "fk_rails_3a6ec44980", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "profile_id",  limit: 4
    t.integer  "post_id",     limit: 4
    t.string   "reason",      limit: 255
    t.datetime "reported_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "data_type",   limit: 4
  end

  add_index "reports", ["profile_id"], name: "fk_rails_b0728d5414", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "simple_captcha_data", force: :cascade do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "survey_answers", force: :cascade do |t|
    t.integer  "attempt_id",  limit: 4
    t.integer  "question_id", limit: 4
    t.integer  "option_id",   limit: 4
    t.boolean  "correct",     limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_attempts", force: :cascade do |t|
    t.integer "participant_id",   limit: 4
    t.string  "participant_type", limit: 255
    t.integer "survey_id",        limit: 4
    t.boolean "winner",           limit: 1
    t.integer "score",            limit: 4
  end

  create_table "survey_options", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.integer  "weight",      limit: 4,   default: 0
    t.string   "text",        limit: 255
    t.boolean  "correct",     limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_questions", force: :cascade do |t|
    t.integer  "survey_id",  limit: 4
    t.string   "text",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_surveys", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.integer  "attempts_number", limit: 4,     default: 0
    t.boolean  "finished",        limit: 1,     default: false
    t.boolean  "active",          limit: 1,     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",         limit: 4,                     null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",            limit: 255
    t.string   "password_digest",  limit: 255
    t.integer  "profile_complete", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "yellowpages", force: :cascade do |t|
    t.integer  "profile_id",   limit: 4
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

  add_index "yellowpages", ["community_id"], name: "fk_rails_75feb902bd", using: :btree
  add_index "yellowpages", ["profile_id"], name: "fk_rails_e17757794a", using: :btree

  add_foreign_key "comments", "profiles"
  add_foreign_key "polls", "communities"
  add_foreign_key "polls", "posts"
  add_foreign_key "polls", "profiles"
  add_foreign_key "posts", "communities"
  add_foreign_key "posts", "profiles"
  add_foreign_key "profiles", "communities"
  add_foreign_key "profiles", "roles"
  add_foreign_key "ratings", "profiles"
  add_foreign_key "reports", "profiles"
  add_foreign_key "yellowpages", "communities"
  add_foreign_key "yellowpages", "profiles"
end
