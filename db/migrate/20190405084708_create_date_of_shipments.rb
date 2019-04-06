class CreateDateOfShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :date_of_shipments do |t|
      t.string :name
      t.timestamps
    end
  end
end
