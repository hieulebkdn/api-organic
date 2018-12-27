class Review < ApplicationRecord
  belongs_to :user
  delegate :email, to: :user, allow_nil: true, prefix: true

  scope :fetch_review_in_list, ->(list_ids){where "id IN (?)", list_ids}
  scope :get_in_list, ->(list_id){where "id IN (?)",list_id }
end
