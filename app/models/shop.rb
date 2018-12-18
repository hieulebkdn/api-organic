class Shop < ApplicationRecord
  self.table_name = "tbl_shop"

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  scope :alphabet, ->{order name: :asc}
end
