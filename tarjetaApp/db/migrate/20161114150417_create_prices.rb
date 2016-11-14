class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :store_id
      t.timestamp :buy_date
      t.integer :total
      t.references :card, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
