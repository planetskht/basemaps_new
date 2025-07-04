# This migration comes from simple_roles (originally 1)
class CreateUserRoles < ActiveRecord::Migration[8.0]
  def up
    create_table :user_roles do |t|
      t.integer :user_id, :null => false
      t.integer :role_id, :null => false

      t.timestamps
    end

    add_index :user_roles, [:user_id, :role_id]
 end

  def down
    drop_table :user_roles
  end
end
