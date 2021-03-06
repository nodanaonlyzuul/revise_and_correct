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

ActiveRecord::Schema.define(version: 20180421215000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "replies", force: :cascade do |t|
    t.text "text"
    t.bigint "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_replies_on_tweet_id"
  end

  create_table "retweets", force: :cascade do |t|
    t.string "twitter_id"
    t.jsonb "original_response"
    t.bigint "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "replied_at"
    t.index ["tweet_id"], name: "index_retweets_on_tweet_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.integer "twitter_account_id"
    t.string "twitter_id"
    t.integer "reply_id"
    t.string "text"
    t.datetime "tweeted_at"
    t.integer "retweets_count"
    t.jsonb "original_response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reply_id"], name: "index_tweets_on_reply_id"
    t.index ["twitter_account_id"], name: "index_tweets_on_twitter_account_id"
    t.index ["twitter_id"], name: "index_tweets_on_twitter_id"
  end

  create_table "twitter_accounts", force: :cascade do |t|
    t.string "screen_name"
    t.string "twitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "original_response"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "screen_name"
    t.string "twitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key"
    t.string "secret"
  end

  add_foreign_key "replies", "tweets"
  add_foreign_key "retweets", "tweets"
end
