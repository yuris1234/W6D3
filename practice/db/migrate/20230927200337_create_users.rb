class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :users, if_exists: true 
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.timestamps
    end
  end
end
