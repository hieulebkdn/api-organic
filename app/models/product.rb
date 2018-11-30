class Product < ApplicationRecord
  self.table_name = "tbl_product"

  scope :alphabet, ->{order name: :asc}
end
