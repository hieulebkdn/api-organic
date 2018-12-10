class Shop < ApplicationRecord
  self.table_name = "tbl_shop"

  scope :alphabet, ->{order name: :asc}
end
