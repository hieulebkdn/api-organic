class RefUserRole < ApplicationRecord
  self.table_name = "ref_user_role"

  belongs_to :user, foreign_key: :tbl_user_id
  belongs_to :role, foreign_key: :tbl_role_id
end
