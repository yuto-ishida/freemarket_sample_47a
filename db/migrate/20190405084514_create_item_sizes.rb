class CreateItemSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :item_sizes do |t|
      t.string :name
      t.integer :parent
      t.timestamps
    end
  end
end
