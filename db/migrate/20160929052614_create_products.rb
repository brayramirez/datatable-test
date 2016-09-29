class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :amount
      t.integer :stock
      t.datetime :available

      t.timestamps
    end
  end
end
