class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.date :date
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
	add_index :prices, [:user_id]
  end
end
