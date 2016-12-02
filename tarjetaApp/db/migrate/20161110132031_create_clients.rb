class CreateClients < ActiveRecord::Migration
  def change
    #create_table :clients, {:id => false} do |t|
    create_table :clients, id: false do |t|
      
      t.string :id, primary_key: true
      #t.integer :dni, primary_key: true
      t.string :name
      t.string :surname
      t.string :tlf
      t.string :email
      t.string :address

      t.timestamps null: false
    end
  end
end
