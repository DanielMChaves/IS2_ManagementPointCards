class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.int :id
      t.int :store_id
      t.timestamp :buy_date
      t.int :total
      t.references :card, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
