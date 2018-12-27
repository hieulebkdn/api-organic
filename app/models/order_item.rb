class OrderItem < ApplicationRecord
  self.table_name = "tbl_order_item"

  belongs_to :product

  scope :fetch_items_in_order, ->(order_id){where tbl_order_id: order_id}
  delegate :name, :to => :product, allow_nil: true, prefix: true
end
