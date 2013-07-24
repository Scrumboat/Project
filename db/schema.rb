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

ActiveRecord::Schema.define(:version => 20130724102738) do

  create_table "admins", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "berths", :force => true do |t|
    t.integer  "number"
    t.decimal  "length"
    t.decimal  "width"
    t.decimal  "depth"
    t.boolean  "exists"
    t.integer  "dock_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "Reknro"
    t.integer  "jno"
    t.date     "vartio"
  end

  add_index "berths", ["dock_id"], :name => "index_berths_on_dock_id"

  create_table "boats", :force => true do |t|
    t.date     "RekPvm"
    t.date     "MuutosPvm"
    t.string   "Nimi"
    t.string   "tyyppi"
    t.string   "RekNro"
    t.string   "ValmMalli"
    t.decimal  "Pituus"
    t.decimal  "Leveys"
    t.decimal  "Syvyys"
    t.decimal  "Uppouma"
    t.decimal  "Korkeus"
    t.string   "Teho"
    t.integer  "Vuosimalli"
    t.string   "VenePuhA"
    t.string   "VenePuhB"
    t.string   "Huomautukset"
    t.integer  "Tarra"
    t.string   "Katsastus"
    t.string   "Telakka"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "boats_members", :force => true do |t|
    t.integer  "boat_id"
    t.integer  "member_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "docks", :force => true do |t|
    t.decimal  "length"
    t.integer  "berth_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dockyard_spots", :force => true do |t|
    t.integer  "number"
    t.float    "length"
    t.float    "width"
    t.float    "boat_width"
    t.float    "boat_length"
    t.boolean  "trailer"
    t.boolean  "lift"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "dockyard_id"
    t.integer  "boat_id"
  end

  create_table "dockyards", :force => true do |t|
    t.string   "name"
    t.float    "length"
    t.float    "width"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invoices", :force => true do |t|
    t.string   "nimi"
    t.integer  "jno"
    t.string   "toimihlokerroin"
    t.integer  "talkookerroin"
    t.decimal  "viitesuoritukset"
    t.decimal  "suorituksetIlmanViitetta"
    t.decimal  "suorituksetKassaan"
    t.decimal  "annetutHyvitykset"
    t.decimal  "maksetunSummanPalautus"
    t.decimal  "liittymismaksu"
    t.decimal  "jasenmaksu"
    t.decimal  "edellisenKaudenLaskutus"
    t.decimal  "venerekisterimaksu"
    t.decimal  "varastokoppimaksu"
    t.decimal  "laiturimaksu"
    t.decimal  "ensirekisterimaksu"
    t.decimal  "telakkamaksu"
    t.decimal  "muutMaksut"
    t.decimal  "talkoosakko"
    t.decimal  "katsastussakko"
    t.decimal  "vartiosakko"
    t.decimal  "laskutuslisa"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "mallis", :force => true do |t|
    t.string   "tyyppi"
    t.string   "ValmMalli"
    t.decimal  "Pituus"
    t.decimal  "Leveys"
    t.decimal  "Syvyys"
    t.decimal  "Uppouma"
    t.decimal  "Korkeus"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "Nimi"
    t.integer  "Jno"
    t.string   "Sotu"
    t.date     "Liittynyt"
    t.string   "JK"
    t.date     "MuutosPvm"
    t.string   "Toimi"
    t.string   "Lisenssi"
    t.string   "Osoite"
    t.string   "Posti"
    t.string   "Maa"
    t.string   "KotiPuh"
    t.string   "MatkaPuh"
    t.string   "TyoPuh"
    t.string   "EmailFax"
    t.string   "Ammatti"
    t.string   "Laivuri"
    t.string   "Huom"
    t.string   "Varasto"
    t.string   "Avain"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "deleted",    :default => false
    t.date     "deleted_at"
  end

  create_table "ownerships", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "boat_id"
    t.integer  "member_id"
  end

  create_table "pricings", :force => true do |t|
    t.string   "target"
    t.decimal  "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "storages", :force => true do |t|
    t.string   "vk"
    t.decimal  "pala"
    t.integer  "jno"
    t.integer  "koppimk"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "versions", :force => true do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "user_name"
    t.text     "modifications"
    t.integer  "number"
    t.integer  "reverted_from"
    t.string   "tag"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "versions", ["created_at"], :name => "index_versions_on_created_at"
  add_index "versions", ["number"], :name => "index_versions_on_number"
  add_index "versions", ["tag"], :name => "index_versions_on_tag"
  add_index "versions", ["user_id", "user_type"], :name => "index_versions_on_user_id_and_user_type"
  add_index "versions", ["user_name"], :name => "index_versions_on_user_name"
  add_index "versions", ["versioned_id", "versioned_type"], :name => "index_versions_on_versioned_id_and_versioned_type"

end
