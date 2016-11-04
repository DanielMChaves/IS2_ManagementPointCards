class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
