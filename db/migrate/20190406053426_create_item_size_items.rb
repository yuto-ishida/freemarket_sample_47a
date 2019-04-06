class CreateItemSizeItems < ActiveRecord::Migration[5.0]
  def change
    create_table :item_size_items do |t|
      t.references :item_size, null: false, foregin_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
