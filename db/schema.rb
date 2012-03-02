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

ActiveRecord::Schema.define(:version => 20111111194558) do

  create_table "blips", :force => true do |t|
    t.integer  "invoice_id"
    t.date     "date"
    t.string   "description"
    t.float    "ppu"
    t.integer  "qtt"
    t.float    "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "zip"
    t.string   "poblacio"
    t.string   "city"
    t.string   "nif"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invoices", :force => true do |t|
    t.string   "number"
    t.date     "date"
    t.text     "comment"
    t.float    "base"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "client_id"
    t.string   "status"
    t.float    "irpf"
    t.float    "iva"
    t.string   "client_name"
    t.string   "client_address"
    t.string   "client_zip"
    t.string   "client_poblacio"
    t.string   "client_ciutat"
    t.string   "client_nif"
  end

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
