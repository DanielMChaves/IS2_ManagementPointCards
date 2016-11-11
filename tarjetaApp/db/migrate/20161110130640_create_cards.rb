class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      # Atrribute "id" is generated automatically
      # (integer, autincrement, primary key)
      t.integer :points
      t.boolean :status

      # t.references creates an attribute called "card_id" automatically
      t.references :client, foreign_key: true

      t.timestamps null: false
    end
  end
end
