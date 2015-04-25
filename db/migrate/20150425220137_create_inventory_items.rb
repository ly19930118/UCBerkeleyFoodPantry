class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.integer :stock
      t.integer :max_per_order

      t.timestamps null: false
    end
  end
end
