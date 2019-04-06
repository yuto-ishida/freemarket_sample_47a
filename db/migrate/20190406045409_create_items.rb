class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.references :user, null:false,foreign_key: true
      t.integer :category_parent
      t.integer :category_child
      t.integer :category_grandchild
      t.references :brand, foreign_key: true
      t.references :item_image, foreign_key: true
      t.references :condition, null: false, foreign_key: true
      t.references :item_size, null: false, foreign_key: true
      t.references :shipping_burden, null: false, foreign_key: true
      t.references :shipping_style, null: false, foreign_key: true
      t.integer    :price, null: false
      t.references :credit, foregin_key: true
      t.references :status, null: false, foreign_key: true
      t.timestamps
    end
  end
end
