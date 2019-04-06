class CreateShippingBurdens < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_burdens do |t|
      t.string :name
      t.timestamps
    end
  end
end
