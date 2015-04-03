class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :facebook
      t.string :location
      t.string :hours

      t.timestamps null: false
    end
  end
end
