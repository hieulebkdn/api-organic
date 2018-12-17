class ChangePasswordTypeInUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :tbl_user, :password, :password_digest
    change_column :tbl_user, :password_digest, :string
  end
end
