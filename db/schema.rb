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

ActiveRecord::Schema.define(version: 2018_11_15_033742) do

  create_table "developer_project", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "developer_id", null: false
    t.integer "project_id", null: false
    t.index ["developer_id"], name: "FKqvlfohp07u22km7y6po87uw5c"
    t.index ["project_id"], name: "FKd2ql7n65acbr6otw34t8tr4oy"
  end

  create_table "hibernate_sequence", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "next_val"
  end

  create_table "hibernate_sequences", primary_key: "sequence_name", id: :string, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "next_val"
  end

  create_table "ref_order_item_status", primary_key: "code", id: :string, limit: 1, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "order_item_status", limit: 7
  end

  create_table "ref_order_status", primary_key: "code", id: :string, limit: 1, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "order_status", limit: 9
  end

  create_table "ref_role_permission", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "is_enabled", default: false
    t.integer "tbl_role_id", null: false
    t.integer "tbl_permission_id", null: false
    t.index ["tbl_permission_id"], name: "fk_ref_role_permission_tbl_permission1_idx"
    t.index ["tbl_role_id"], name: "fk_ref_role_permission_tbl_role1_idx"
  end

  create_table "ref_shop_product", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tbl_product_id", null: false
    t.integer "tbl_farm_id", null: false
    t.integer "tbl_shop_id", null: false
    t.index ["tbl_product_id"], name: "fk_ref_farm_product_tbl_product1_idx"
    t.index ["tbl_shop_id"], name: "fk_ref_shop_product_tbl_shop1_idx"
  end

  create_table "ref_user_role", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tbl_user_id", null: false
    t.integer "tbl_role_id", null: false
    t.integer "id_role", null: false
    t.index ["tbl_role_id"], name: "fk_ref_user_role_tbl_role1_idx"
    t.index ["tbl_user_id"], name: "fk_ref_user_role_tbl_user1_idx"
  end

  create_table "system_example", id: :bigint, default: nil, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "lastaudit"
    t.string "name"
  end

  create_table "tbl_account", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "city"
    t.text "address", limit: 16777215
    t.boolean "gender"
    t.datetime "dob"
    t.integer "tbl_user_id", null: false
    t.index ["tbl_user_id"], name: "fk_tbl_account_tbl_user1_idx"
  end

  create_table "tbl_category", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "parent_id"
    t.index ["name"], name: "name_UNIQUE", unique: true
  end

  create_table "tbl_discount", primary_key: "code", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "discount_number", precision: 3, scale: 2
  end

  create_table "tbl_order", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "order_status_code", limit: 45, null: false
    t.datetime "date_order_placed"
    t.integer "tbl_payment_id", null: false
    t.string "ref_order_status_code", limit: 1, null: false
    t.integer "tbl_discount_code", null: false
    t.index ["ref_order_status_code"], name: "fk_tbl_order_ref_order_status1_idx"
    t.index ["tbl_discount_code"], name: "fk_tbl_order_tbl_discount1_idx"
    t.index ["tbl_payment_id"], name: "fk_tbl_order_tbl_payment1_idx"
  end

  create_table "tbl_order_item", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "quantity", limit: 2
    t.integer "tbl_order_id", null: false
    t.integer "tbl_product_id", null: false
    t.string "ref_order_item_status_code", limit: 1, null: false
    t.index ["ref_order_item_status_code"], name: "fk_tbl_order_item_ref_order_item_status1_idx"
    t.index ["tbl_order_id"], name: "fk_tbl_order_item_tbl_order1_idx"
    t.index ["tbl_product_id"], name: "fk_tbl_order_item_tbl_product1_idx"
  end

  create_table "tbl_payment", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "name_UNIQUE", unique: true
  end

  create_table "tbl_permission", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "controller", null: false
    t.string "action", limit: 6, null: false
  end

  create_table "tbl_product", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", precision: 13, scale: 2, null: false, unsigned: true
    t.string "unit", limit: 45, null: false
    t.integer "stock", limit: 2, null: false, unsigned: true
    t.string "sku", limit: 45
    t.integer "tbl_category_id", null: false
    t.index ["sku"], name: "sku_UNIQUE", unique: true
    t.index ["tbl_category_id"], name: "fk_tbl_product_tbl_category1_idx"
  end

  create_table "tbl_product_description", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tbl_product_id", null: false
    t.index ["tbl_product_id"], name: "fk_tbl_product_description_tbl_product1_idx"
  end

  create_table "tbl_product_image", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.binary "image"
    t.integer "tbl_product_id", null: false
    t.index ["tbl_product_id"], name: "fk_tbl_product_image_tbl_product1_idx"
  end

  create_table "tbl_rank", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 8
  end

  create_table "tbl_role", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 45
  end

  create_table "tbl_role_user", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "roles_id", null: false
    t.integer "user_id", null: false
    t.index ["roles_id"], name: "FKnbs58o7fpfum0mfrf34y1fsds"
    t.index ["user_id"], name: "FKn679clgn0jm2cq4hmmqodiuye"
  end

  create_table "tbl_shop", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description", limit: 16777215
    t.binary "image", limit: 16777215
  end

  create_table "tbl_user", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username", limit: 80, null: false
    t.string "email", null: false
    t.string "phone", limit: 15, null: false
    t.text "password"
    t.integer "tbl_rank_id"
    t.integer "tbl_shop_id"
    t.integer "role"
    t.index ["email"], name: "email_UNIQUE", unique: true
    t.index ["phone"], name: "phone_UNIQUE", unique: true
    t.index ["role"], name: "FK1qhctjsa2f8n948vp5wvvdlmy"
    t.index ["tbl_rank_id"], name: "fk_tbl_user_tbl_rank1_idx"
    t.index ["tbl_shop_id"], name: "fk_tbl_user_tbl_shop1_idx"
    t.index ["username"], name: "username_UNIQUE", unique: true
  end

  create_table "test_role", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 45
  end

  create_table "user_test", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "phone"
    t.integer "role"
    t.index ["role"], name: "FKfplvy424hwdxrw36sbssnmfk1"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_authorities", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "authority_id", null: false
    t.index ["authority_id"], name: "FK9hklsjxvqucyku1e8dsq2jp8d"
    t.index ["user_id"], name: "FKhbydipbidvo0ohm7i1na1daa8"
  end

  add_foreign_key "ref_role_permission", "tbl_permission", name: "fk_ref_role_permission_tbl_permission1"
  add_foreign_key "ref_role_permission", "tbl_role", name: "fk_ref_role_permission_tbl_role1"
  add_foreign_key "ref_shop_product", "tbl_product", name: "fk_ref_farm_product_tbl_product1"
  add_foreign_key "ref_shop_product", "tbl_shop", name: "fk_ref_shop_product_tbl_shop1"
  add_foreign_key "ref_user_role", "tbl_role", name: "fk_ref_user_role_tbl_role1"
  add_foreign_key "ref_user_role", "tbl_user", column: "id", name: "FKe6s42nwa03mhgd7m1onjsyyml"
  add_foreign_key "ref_user_role", "tbl_user", name: "fk_ref_user_role_tbl_user1"
  add_foreign_key "tbl_account", "tbl_user", name: "fk_tbl_account_tbl_user1"
  add_foreign_key "tbl_order", "ref_order_status", column: "ref_order_status_code", primary_key: "code", name: "fk_tbl_order_ref_order_status1"
  add_foreign_key "tbl_order", "tbl_discount", column: "tbl_discount_code", primary_key: "code", name: "fk_tbl_order_tbl_discount1"
  add_foreign_key "tbl_order", "tbl_payment", name: "fk_tbl_order_tbl_payment1"
  add_foreign_key "tbl_order_item", "ref_order_item_status", column: "ref_order_item_status_code", primary_key: "code", name: "fk_tbl_order_item_ref_order_item_status1"
  add_foreign_key "tbl_order_item", "tbl_order", name: "fk_tbl_order_item_tbl_order1"
  add_foreign_key "tbl_order_item", "tbl_product", name: "fk_tbl_order_item_tbl_product1"
  add_foreign_key "tbl_product", "tbl_category", name: "fk_tbl_product_tbl_category1"
  add_foreign_key "tbl_product_description", "tbl_product", name: "fk_tbl_product_description_tbl_product1"
  add_foreign_key "tbl_product_image", "tbl_product", name: "fk_tbl_product_image_tbl_product1"
  add_foreign_key "tbl_role", "ref_user_role", column: "id", name: "FKnehnb6b0wntu1bgiqf46k5pid"
  add_foreign_key "tbl_user", "ref_user_role", column: "id", name: "FKth86gaktgpe5nh7qg0of2sqjt"
  add_foreign_key "tbl_user", "ref_user_role", column: "role", name: "FKayfmv7p2cb00uoddjor8cmlia"
  add_foreign_key "tbl_user", "tbl_rank", name: "fk_tbl_user_tbl_rank1"
  add_foreign_key "tbl_user", "tbl_role", column: "role", name: "FK1qhctjsa2f8n948vp5wvvdlmy"
  add_foreign_key "tbl_user", "tbl_shop", name: "fk_tbl_user_tbl_shop1"
  add_foreign_key "user_test", "test_role", column: "role", name: "FKfplvy424hwdxrw36sbssnmfk1"
end
