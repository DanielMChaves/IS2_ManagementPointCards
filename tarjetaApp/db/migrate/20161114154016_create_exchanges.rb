class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.int :id_card
      t.int :id_price
      t.timestamp :exchange_date

      t.timestamps null: false
    end
  end
end
