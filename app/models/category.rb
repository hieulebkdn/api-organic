class Category < ApplicationRecord
  self.table_name = "tbl_category"

  has_many :product, foreign_key: :tbl_category_id, dependent: :destroy
end
