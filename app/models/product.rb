class Product < ApplicationRecord
  self.table_name = "tbl_product"

  VALID_COIN_REGEX = /\A\d{1,10}(\.\d{0,2})?\z/

  has_many :product_image, foreign_key: :tbl_product_id, dependent: :destroy
  has_many :order_item, foreign_key: :tbl_product_id, dependent: :destroy
  has_many :ref_shop_product, foreign_key: :tbl_product_id, dependent: :destroy
  has_many :reviews, foreign_key: :tbl_product_id, dependent: :destroy

  validates :stock, numericality: {only_integer: true}
  validates :price, format: {with: VALID_COIN_REGEX}, numericality: true

  scope :search_by_name, ->(name){where "name LIKE CONCAT('%',?,'%')", name}
  scope :alphabet, ->{order name: :asc}
end
