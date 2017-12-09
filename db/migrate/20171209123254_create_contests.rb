class CreateContests < ActiveRecord::Migration[5.1]
  def change
    create_table :contests do |t|
      t.string :cont_id
      t.string :name
      t.time :start_date

      t.timestamps
    end
  end
end
