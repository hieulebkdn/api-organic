class Payment < ApplicationRecord
  self.table_name :tbl_payment

  has_many :orders, foreign_Key: :tbl_payment_id, dependent: :destroy
end
