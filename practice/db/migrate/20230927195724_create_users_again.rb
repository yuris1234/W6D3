class CreateUsersAgain < ActiveRecord::Migration[7.0]
  def change
    create_table :users_agains do |t|
      t.string :username, null: false
      t.timestamps
    end
  end
end
