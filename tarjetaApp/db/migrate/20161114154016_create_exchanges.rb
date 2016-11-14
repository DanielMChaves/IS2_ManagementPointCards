class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.references :card, index: true, foreign_key: true
      t.references :price, index: true, foreign_key: true
      t.timestamp :exchange_date

      t.timestamps null: false
    end
  end
end
