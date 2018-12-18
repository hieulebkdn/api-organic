class RefUserRole < ApplicationRecord
  self.table_name = "ref_user_role"

  belongs_to :user
  belongs_to :role
end
