class CreateUcRelates < ActiveRecord::Migration[5.1]
  def change
    create_table :uc_relates do |t|
      t.string :user_id
      t.string :cont_id
      t.text :input
      t.string :login_token

      t.timestamps
    end
  end
end
