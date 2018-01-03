class CreateContests < ActiveRecord::Migration[5.1]
  def change
    create_table :contests do |t|
      t.string :cont_id
      t.string :name
      t.string :text
      t.time :start_date
      
      #Contest data
      t.integer :term
      #json structure send to user
      t.text :struct
      #view displayed to user
      t.text :view
      t.integer :int_param

      t.timestamps
    end
  end
end
