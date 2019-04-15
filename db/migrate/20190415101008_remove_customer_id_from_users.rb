class RemoveCustomerIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :customer_id, :integer
  end
end
