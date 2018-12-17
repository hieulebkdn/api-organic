class Role < ApplicationRecord
  self.table_name = "tbl_role"

  has_many :ref_user_role
end
