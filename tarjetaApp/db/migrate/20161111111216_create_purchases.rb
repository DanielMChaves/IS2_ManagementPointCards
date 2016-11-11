class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      # Atrribute "id" is generated automatically
      # (integer, autoincrement, primary key)
      t.integer :id_store
      t.integer :total

      # t.references creates an attribute called "card_id" automatically
      t.references :card, foreign_key: true

      t.timestamps null: false
    end
  end
end
