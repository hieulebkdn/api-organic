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

ActiveRecord::Schema.define(version: 2018_12_16_030749) do

  create_table "hibernate_sequence", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
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

  create_table "ref_shop_product", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tbl_product_id", null: false
    t.integer "tbl_shop_id", null: false
    t.index ["tbl_product_id"], name: "fk_ref_farm_product_tbl_product1_idx"
    t.index ["tbl_shop_id"], name: "fk_ref_shop_product_tbl_shop1_idx"
  end

  create_table "ref_user_role", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tbl_user_id", null: false
    t.integer "tbl_role_id", null: false
    t.index ["tbl_role_id"], name: "fk_ref_user_role_tbl_role1_idx"
    t.index ["tbl_user_id"], name: "fk_ref_user_role_tbl_user1_idx"
  end

  create_table "tbl_account", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "city"
    t.text "address", limit: 16777215
    t.boolean "gender", default: true
    t.date "dob"
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
    t.string "order_status_code", limit: 45
    t.datetime "date_order_placed"
    t.integer "tbl_payment_id", null: false
    t.string "ref_order_status_code", limit: 1
    t.integer "tbl_discount_code", null: false
    t.integer "tbl_user_id", null: false
    t.index ["ref_order_status_code"], name: "a_idx"
    t.index ["tbl_discount_code"], name: "aa_idx"
    t.index ["tbl_payment_id"], name: "aaa_idx"
  end

  create_table "tbl_order_item", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "quantity", limit: 2
    t.integer "tbl_order_id", null: false
    t.integer "tbl_product_id", null: false
    t.string "ref_order_item_status_code", limit: 1, null: false
    t.index ["ref_order_item_status_code"], name: "fk_tbl_order_item_ref_order_item_status1_idx"
    t.index ["tbl_order_id"], name: "fk_tbl_order_item_tbl_order1_idx"
  end

  create_table "tbl_payment", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "name_UNIQUE", unique: true
  end

  create_table "tbl_permission", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "controller", null: false
    t.string "action", limit: 4, null: false
  end

  create_table "tbl_product", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", null: false, collation: "utf8_general_ci"
    t.decimal "price", precision: 13, scale: 2, null: false, unsigned: true
    t.string "unit", limit: 45, null: false, collation: "utf8_general_ci"
    t.integer "stock", limit: 2, null: false, unsigned: true
    t.string "sku", limit: 45, collation: "utf8_general_ci"
    t.integer "tbl_category_id", null: false
    t.binary "avatar"
    t.integer "rating", default: 5, null: false
    t.integer "buy", null: false
    t.index ["sku"], name: "sku_UNIQUE", unique: true
    t.index ["tbl_category_id"], name: "fk_tbl_product_tbl_category1_idx"
  end

  create_table "tbl_product_description", id: :string, limit: 45, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tbl_product_id", null: false
    t.integer "purchases", null: false
    t.integer "review", null: false
    t.text "description", null: false
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

  create_table "tbl_shop", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description", limit: 16777215
    t.binary "image"
  end

  create_table "tbl_user", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "phone", limit: 15, null: false
    t.string "password_digest"
    t.integer "tbl_rank_id", default: 4
    t.integer "tbl_shop_id"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "updated_at"
    t.index ["email"], name: "email_UNIQUE", unique: true
    t.index ["phone"], name: "phone_UNIQUE", unique: true
    t.index ["tbl_rank_id"], name: "fk_tbl_user_tbl_rank1_idx"
    t.index ["tbl_shop_id"], name: "fk_tbl_user_tbl_shop1_idx"
  end

  add_foreign_key "ref_role_permission", "tbl_permission", name: "fk_ref_role_permission_tbl_permission1"
  add_foreign_key "ref_role_permission", "tbl_role", name: "fk_ref_role_permission_tbl_role1"
  add_foreign_key "ref_shop_product", "tbl_product", name: "FK32mreqr2g0nseckfhp7gd1nyf"
  add_foreign_key "ref_shop_product", "tbl_product", name: "fk_ref_farm_product_tbl_product1"
  add_foreign_key "ref_shop_product", "tbl_shop", name: "FKbepx2hhtl3g07g34jqldjq7y"
  add_foreign_key "ref_shop_product", "tbl_shop", name: "fk_ref_shop_product_tbl_shop1"
  add_foreign_key "ref_user_role", "tbl_role", name: "FKefpsu890ogldbbiqr47c6deja"
  add_foreign_key "ref_user_role", "tbl_role", name: "fk_ref_user_role_tbl_role1"
  add_foreign_key "ref_user_role", "tbl_user", name: "FKqvs4e1phqw2en9iuboc73remt"
  add_foreign_key "ref_user_role", "tbl_user", name: "fk_ref_user_role_tbl_user1"
  add_foreign_key "tbl_account", "tbl_user", name: "fk_tbl_account_tbl_user1"
  add_foreign_key "tbl_order", "ref_order_status", column: "ref_order_status_code", primary_key: "code", name: "FKoclhloyidc9a1rmqb02jtn0u1"
  add_foreign_key "tbl_order", "tbl_discount", column: "tbl_discount_code", primary_key: "code", name: "FKrv59e37b64umdr64e7bul7kb5"
  add_foreign_key "tbl_order", "tbl_payment", name: "FK2w81k6x8i4qlm7abrqxv1wce9"
  add_foreign_key "tbl_order_item", "ref_order_item_status", column: "ref_order_item_status_code", primary_key: "code", name: "FKkv4737wla3dk03gy15xv5khm0"
  add_foreign_key "tbl_order_item", "ref_order_item_status", column: "ref_order_item_status_code", primary_key: "code", name: "fk_tbl_order_item_ref_order_item_status1"
  add_foreign_key "tbl_order_item", "tbl_order", name: "FKbwvxweep37lo58y373l5sea5w"
  add_foreign_key "tbl_order_item", "tbl_order", name: "fk_tbl_order_item_tbl_order1"
  add_foreign_key "tbl_product", "tbl_category", name: "fk_tbl_product_tbl_category1"
  add_foreign_key "tbl_product_description", "tbl_product", name: "fk_tbl_product_description_tbl_product1"
  add_foreign_key "tbl_product_image", "tbl_product", name: "fk_tbl_product_image_tbl_product1"
  add_foreign_key "tbl_user", "tbl_rank", name: "fk_tbl_user_tbl_rank1"
  add_foreign_key "tbl_user", "tbl_shop", name: "fk_tbl_user_tbl_shop1"
end
