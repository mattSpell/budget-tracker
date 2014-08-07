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

ActiveRecord::Schema.define(version: 20140807140300) do

  create_table "actual", force: true do |t|
    t.string  "category"
    t.string  "type"
    t.integer "amount_to_debit_or_credit"
    t.integer "goal_id"
  end

  create_table "bank", force: true do |t|
    t.integer "balance"
  end

  create_table "goal", force: true do |t|
    t.string  "category"
    t.integer "goal_amount"
    t.integer "bank_id"
  end

end
