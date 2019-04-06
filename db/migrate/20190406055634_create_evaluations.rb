class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.references :user, null: false,foreign_key: true
      t.references :item, null: false,foreign_key: true
      t.integer :satisfaction, null: false, foreign_key: true
      t.timestamps
    end
  end
end
