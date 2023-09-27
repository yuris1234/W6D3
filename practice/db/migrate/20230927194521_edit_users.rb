class EditUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, null: false, unique: true
    


  end
end
