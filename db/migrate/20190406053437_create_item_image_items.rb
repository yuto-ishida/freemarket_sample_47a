class CreateItemImageItems < ActiveRecord::Migration[5.0]
  def change
    create_table :item_image_items do |t|
      t.references :item_image, null: false, foregin_key: true
      t.references :item, null: false,foreign_key: true
      t.timestamps
    end
  end
end
