class Shop < ApplicationRecord
  self.table_name = "tbl_shop"

  has_many :users, foreign_key: :tbl_shop_id, dependent: :destroy
  has_many :product, foreign_key: :tbl_shop_id, dependent: :destroy
  has_many :ref_shop_product, foreign_key: :tbl_shop_id, dependent: :destroy

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  scope :alphabet, ->{order name: :asc}
end
