class Order < ApplicationRecord
  self  .table_name = "tbl_order"

  scope :fetch_user_orders, ->(user_id){where tbl_user_id: user_id}
  scope :fetch_review_in_list, ->(list_ids){where "id IN (?)", list_ids}

end
