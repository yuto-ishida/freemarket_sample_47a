class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :name         ,null: false
      t.string :customer_id  ,null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
