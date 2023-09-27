class DropUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :users_agains
  end
end
