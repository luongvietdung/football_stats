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

ActiveRecord::Schema.define(version: 20160216151531) do

  create_table "bettings", force: :cascade do |t|
    t.integer  "total_match",     limit: 4,                           default: 0
    t.integer  "win",             limit: 4,                           default: 0
    t.integer  "draw",            limit: 4,                           default: 0
    t.integer  "lost",            limit: 4,                           default: 0
    t.integer  "offset",          limit: 4,                           default: 0
    t.integer  "over",            limit: 4,                           default: 0
    t.decimal  "ratio",                       precision: 5, scale: 2
    t.integer  "league_teams_id", limit: 4
    t.string   "team_code",       limit: 255
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  add_index "bettings", ["league_teams_id"], name: "index_bettings_on_league_teams_id", using: :btree

  create_table "cards", force: :cascade do |t|
    t.integer  "total_match",          limit: 4,                           default: 0
    t.integer  "home_yellow",          limit: 4,                           default: 0
    t.integer  "guest_yellow",         limit: 4,                           default: 0
    t.decimal  "avg_yellow_per_match",             precision: 5, scale: 2
    t.decimal  "avg_yellow_home",                  precision: 5, scale: 2
    t.decimal  "avg_yellow_guest",                 precision: 5, scale: 2
    t.integer  "home_red",             limit: 4,                           default: 0
    t.integer  "guest_red",            limit: 4,                           default: 0
    t.decimal  "avg_red_per_match",                precision: 5, scale: 2
    t.decimal  "avg_red_home",                     precision: 5, scale: 2
    t.decimal  "avg_red_guest",                    precision: 5, scale: 2
    t.integer  "league_teams_id",      limit: 4
    t.string   "team_code",            limit: 255
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
  end

  add_index "cards", ["league_teams_id"], name: "index_cards_on_league_teams_id", using: :btree

  create_table "corners", force: :cascade do |t|
    t.integer  "total_match",     limit: 4,                           default: 0
    t.integer  "win_match",       limit: 4,                           default: 0
    t.integer  "draw_match",      limit: 4,                           default: 0
    t.integer  "lost_match",      limit: 4,                           default: 0
    t.integer  "home",            limit: 4,                           default: 0
    t.integer  "guest",           limit: 4,                           default: 0
    t.decimal  "avg_home",                    precision: 5, scale: 2
    t.decimal  "avg_guest",                   precision: 5, scale: 2
    t.decimal  "avg_season",                  precision: 5, scale: 2
    t.integer  "league_teams_id", limit: 4
    t.string   "team_code",       limit: 255
    t.integer  "m_phases_id",     limit: 4
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  add_index "corners", ["league_teams_id"], name: "index_corners_on_league_teams_id", using: :btree
  add_index "corners", ["m_phases_id"], name: "index_corners_on_m_phases_id", using: :btree

  create_table "even_olds", force: :cascade do |t|
    t.integer  "total_match",     limit: 4,                           default: 0
    t.integer  "even",            limit: 4,                           default: 0
    t.integer  "old",             limit: 4,                           default: 0
    t.decimal  "old_ratio",                   precision: 5, scale: 2
    t.decimal  "even_ratio",                  precision: 5, scale: 2
    t.integer  "league_teams_id", limit: 4
    t.string   "team_code",       limit: 255
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  add_index "even_olds", ["league_teams_id"], name: "index_even_olds_on_league_teams_id", using: :btree

  create_table "league_season_referees", force: :cascade do |t|
    t.integer  "referees_id",       limit: 4
    t.integer  "league_seasons_id", limit: 4
    t.integer  "total_match",       limit: 4,                           default: 0
    t.integer  "yellow",            limit: 4,                           default: 0
    t.decimal  "avg_yellow",                    precision: 5, scale: 2
    t.integer  "red",               limit: 4,                           default: 0
    t.decimal  "ave_red",                       precision: 5, scale: 2
    t.decimal  "pen",                           precision: 5, scale: 2
    t.decimal  "foult",                         precision: 5, scale: 2
    t.string   "name",              limit: 255
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
  end

  add_index "league_season_referees", ["league_seasons_id"], name: "index_league_season_referees_on_league_seasons_id", using: :btree
  add_index "league_season_referees", ["referees_id"], name: "index_league_season_referees_on_referees_id", using: :btree

  create_table "league_seasons", force: :cascade do |t|
    t.integer  "leagues_id", limit: 4
    t.integer  "seasons_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "league_seasons", ["leagues_id"], name: "index_league_seasons_on_leagues_id", using: :btree
  add_index "league_seasons", ["seasons_id"], name: "index_league_seasons_on_seasons_id", using: :btree

  create_table "league_teams", force: :cascade do |t|
    t.integer  "teams_id",          limit: 4
    t.integer  "league_seasons_id", limit: 4
    t.string   "team_code",         limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "league_teams", ["league_seasons_id"], name: "index_league_teams_on_league_seasons_id", using: :btree
  add_index "league_teams", ["teams_id"], name: "index_league_teams_on_teams_id", using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "type",         limit: 4,   default: 0
    t.integer  "m_nations_id", limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "leagues", ["m_nations_id"], name: "index_leagues_on_m_nations_id", using: :btree

  create_table "live_tables", force: :cascade do |t|
    t.integer  "total_match",     limit: 4,   default: 0
    t.integer  "win_match",       limit: 4,   default: 0
    t.integer  "draw_match",      limit: 4,   default: 0
    t.integer  "lost_match",      limit: 4,   default: 0
    t.integer  "goal",            limit: 4,   default: 0
    t.integer  "lost",            limit: 4,   default: 0
    t.integer  "offset",          limit: 4,   default: 0
    t.integer  "point",           limit: 4,   default: 0
    t.integer  "league_teams_id", limit: 4
    t.string   "team_code",       limit: 255
    t.integer  "m_phases_id",     limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "live_tables", ["league_teams_id"], name: "index_live_tables_on_league_teams_id", using: :btree
  add_index "live_tables", ["m_phases_id"], name: "index_live_tables_on_m_phases_id", using: :btree

  create_table "m_nations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "m_phases", force: :cascade do |t|
    t.string   "key_name",   limit: 255
    t.integer  "type",       limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "m_users", force: :cascade do |t|
    t.string   "user_name",              limit: 255
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "m_users", ["email"], name: "index_m_users_on_email", unique: true, using: :btree
  add_index "m_users", ["reset_password_token"], name: "index_m_users_on_reset_password_token", unique: true, using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "league_teams_home_id",  limit: 4
    t.integer  "league_teams_guest_id", limit: 4
    t.string   "team_code_home",        limit: 255
    t.string   "team_code_guest",       limit: 255
    t.date     "match_date"
    t.integer  "home_corners",          limit: 4,   default: 0
    t.integer  "guest_corners",         limit: 4,   default: 0
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "over_unders", force: :cascade do |t|
    t.integer  "total_match",     limit: 4,   default: 0
    t.integer  "over",            limit: 4,   default: 0
    t.integer  "under",           limit: 4,   default: 0
    t.integer  "league_teams_id", limit: 4
    t.string   "team_code",       limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "over_unders", ["league_teams_id"], name: "index_over_unders_on_league_teams_id", using: :btree

  create_table "referees", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "start",      limit: 4
    t.integer  "end",        limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "type",         limit: 4,   default: 0
    t.integer  "m_nations_id", limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "teams", ["m_nations_id"], name: "index_teams_on_m_nations_id", using: :btree

end
