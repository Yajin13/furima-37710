class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code, null: false, foreign_key: true
      t.integer :prefecture_id, null: false, foreign_key: true
      t.string :city, null: false, foreign_key: true
      t.string :number, null: false, foreign_key: true
      t.string :building_name
      t.string :phone_number, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
