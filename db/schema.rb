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

ActiveRecord::Schema.define(:version => 20130824095948) do

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
    t.string   "reknro"
    t.integer  "jno"
    t.date     "vartio"
    t.integer  "boat_id"
  end

  add_index "berths", ["dock_id"], :name => "index_berths_on_dock_id"

  create_table "boats", :force => true do |t|
    t.date     "rek_pvm"
    t.date     "muutos_pvm"
    t.string   "nimi"
    t.string   "tyyppi"
    t.string   "reknro"
    t.string   "valm_malli"
    t.decimal  "pituus"
    t.decimal  "leveys"
    t.decimal  "syvyys"
    t.decimal  "uppouma"
    t.decimal  "korkeus"
    t.string   "teho"
    t.integer  "vuosimalli"
    t.string   "vene_puh_a"
    t.string   "vene_puh_b"
    t.string   "huomautukset"
    t.integer  "tarra"
    t.string   "katsastus"
    t.string   "telakka"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "laituri"
    t.string   "laituripaikka"
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
    t.string   "name"
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

  create_table "employments", :force => true do |t|
    t.string   "nimi"
    t.integer  "hyvityksenSuuruus"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "guardseasons", :force => true do |t|
    t.string   "nimi"
    t.integer  "guardturn_id"
    t.date     "alku_pvm"
    t.date     "loppu_pvm"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "guardturns", :force => true do |t|
    t.date     "vartiointi_pvm"
    t.integer  "jno"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "invoices", :force => true do |t|
    t.string   "nimi"
    t.integer  "jno"
    t.string   "toimihlokerroin"
    t.integer  "talkookerroin"
    t.decimal  "viitesuoritukset"
    t.decimal  "suoritukset_kassaan"
    t.decimal  "liittymismaksu"
    t.decimal  "jasenmaksu"
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.date     "luontipvm"
    t.date     "lahetyspvm"
    t.string   "tunniste"
    t.boolean  "maksettu",            :default => false
    t.integer  "member_id"
    t.date     "erapvm"
    t.decimal  "summa"
    t.string   "viitenumero"
    t.integer  "karhuttu"
    t.string   "vapaasana"
    t.string   "lahetystapa"
    t.boolean  "lahetetty",           :default => false
  end

  create_table "members", :force => true do |t|
    t.string   "nimi"
    t.integer  "jno"
    t.string   "sotu"
    t.date     "liittynyt"
    t.string   "jasentyyppi"
    t.date     "muutos_pvm"
    t.string   "toimi"
    t.string   "lisenssi"
    t.string   "osoite"
    t.string   "posti"
    t.string   "maa"
    t.string   "koti_puh"
    t.string   "matka_puh"
    t.string   "tyo_puh"
    t.string   "email_fax"
    t.string   "ammatti"
    t.string   "laivuri"
    t.string   "huom"
    t.string   "varasto"
    t.string   "avain"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.boolean  "deleted",                    :default => false
    t.date     "deleted_at"
    t.string   "viitenumero"
    t.decimal  "annetut_hyvitykset"
    t.decimal  "suoritukset_ilman_viitetta"
    t.decimal  "maksetun_summan_palautus"
    t.decimal  "edellis_kauden_laskutus"
    t.integer  "vartiolaiminlyonti",         :default => 0
    t.integer  "talkoolaiminlyonti",         :default => 0
    t.integer  "saunottu",                   :default => 0
    t.boolean  "special_billing"
  end

  create_table "models", :force => true do |t|
    t.string   "tyyppi"
    t.string   "valm_malli"
    t.decimal  "pituus"
    t.decimal  "leveys"
    t.decimal  "syvyys"
    t.decimal  "uppouma"
    t.decimal  "korkeus"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ownerships", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "boat_id"
    t.integer  "member_id"
  end

  create_table "payments", :force => true do |t|
    t.date     "payment_date"
    t.decimal  "amount"
    t.string   "ref_number"
    t.boolean  "need_survey"
    t.integer  "invoice_id"
    t.string   "raw_data"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "cash_payment"
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
