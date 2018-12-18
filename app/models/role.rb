class Role < ApplicationRecord
  self.table_name = "tbl_role"

  has_many :ref_user_role, foreign_key: :tbl_role_id

  validates :name, presence: true, uniqueness: true
end
