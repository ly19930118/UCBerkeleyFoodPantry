class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userid
      t.integer :orders_this_month
      t.string :password
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
