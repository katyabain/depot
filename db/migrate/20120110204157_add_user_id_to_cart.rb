class AddUserIdToCart < ActiveRecord::Migration
  def change
    add_column :carts, :user_id, :interger
  end
end
