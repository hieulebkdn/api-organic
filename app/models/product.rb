class Product < ApplicationRecord
  self.table_name = "tbl_product"

  VALID_COIN_REGEX = /\A\d{1,10}(\.\d{0,2})?\z/

  validates :stock, numericality: {only_integer: true}
  validates :price, format: {with: VALID_COIN_REGEX}, numericality: true

  scope :search_by_name, ->(name){where "name LIKE CONCAT('%',?,'%')", name}
  scope :alphabet, ->{order name: :asc}
end
