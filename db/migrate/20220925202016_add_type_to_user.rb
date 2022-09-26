class AddTypeToUser < ActiveRecord::Migration[6.1]
  def change
    remove_column(:users, :age)
    add_column(:users, :type, :string, null: false, default: "User")
    change_column_null(:users, :first_name, false)
    change_column_null(:users, :last_name, false)
    add_index(:users, :type)
  end
end
