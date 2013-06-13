class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.date :date
      t.decimal :price, :precision => 10, :scale => 2
      t.integer :user_id

      t.timestamps
    end
	add_index :prices, [:user_id]
  end
end
