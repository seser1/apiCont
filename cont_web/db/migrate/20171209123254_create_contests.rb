class CreateContests < ActiveRecord::Migration[5.1]
  def change
    create_table :contests do |t|
      t.string :cont_id
      t.string :name
      t.string :text
      t.time :start_date
      
      #Contest data
      t.integer :term
      #template of input structure
      t.text :input_template
      #json structured data send to user
      t.text :data
      #view displayed to user
      t.text :view
      t.integer :int_param

      t.timestamps
    end
  end
end
