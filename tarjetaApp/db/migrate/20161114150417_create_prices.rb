class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :status
      t.integer :requirement
      t.integer :lot
      t.text :concept
    end
  end
end
