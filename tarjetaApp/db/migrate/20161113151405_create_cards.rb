class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :points
      t.boolean :status
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
