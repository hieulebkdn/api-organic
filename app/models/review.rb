class Review < ApplicationRecord
  belongs_to :user, foreign_key: :tbl_user_id
  delegate :email, :to => :user, allow_nil: true, prefix: true
end
