class AddDependentsColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dependents, :integer
  end
end
