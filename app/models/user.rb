class User < ApplicationRecord
  self.table_name = "tbl_user"

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :ref_user_role, foreign_key: :tbl_user_id, dependent: :destroy
  belongs_to :shop, foreign_key: :tbl_shop_id
  has_one :account, foreign_key: :tbl_user_id, dependent: :destroy

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}, presence: true, allow_nil: true

  scope :get_in_list, ->(list_id){where "id IN (?)",list_id }

  delegate :name, :to => :shop, allow_nil: true, prefix: true
  delegate :name, :to => :account, allow_nil: true, prefix: true

  has_secure_password

    # Returns the hash digest of the given string.
    def self.digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end
  end
