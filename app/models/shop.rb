class Shop < ApplicationRecord
  self.table_name = "tbl_shop"

  has_many :users, foreign_key: :tbl_shop_id

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  scope :alphabet, ->{order name: :asc}
end
