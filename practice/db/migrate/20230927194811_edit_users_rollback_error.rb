class EditUsersRollbackError < ActiveRecord::Migration[7.0]
  def change
    # add_column :users, :username, null: false
    remove_column :users, :name
  end
end
