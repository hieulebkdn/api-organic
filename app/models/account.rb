class Account < ApplicationRecord
  self.table_name = "tbl_account"

  belongs_to :user, foreign_key: :tbl_user_id, optional: true
end
