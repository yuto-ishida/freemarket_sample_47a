class CreateContactInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_informations do |t|
      t.references   :user,             foreign_key: true
      t.integer      :person_exhibit
      t.string       :nickname
      t.text         :self_introduction
      t.string       :first_name,       null: false
      t.string       :family_name,      null: false
      t.string       :first_name_kana,  null: false
      t.string       :family_name_kana, null: false
      t.date         :birthday
      t.string       :address_number
      t.integer      :prefecture_id
      t.string       :city
      t.string       :address
      t.string       :building_name
      t.integer      :phone_number
      t.timestamps
    end
  end
end
