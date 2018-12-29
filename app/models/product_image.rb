class ProductImage < ApplicationRecord
  self.table_name = "tbl_product_image"
  belongs_to :product, optional: true
end
