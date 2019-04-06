class CreateEvaluators < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluators do |t|
      t.references :user, null: false,foreign_key: true
      t.references :evaluation, null: false,foreign_key: true
      t.timestamps
    end
  end
end
