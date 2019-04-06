class CreateBrandItems < ActiveRecord::Migration[5.0]
  def change
    create_table :brand_items do |t|
      t.references :brand, null: false, foregin_key: true
      t.references :item, null: false,foreign_key: true
      t.timestamps
    end
  end
end
