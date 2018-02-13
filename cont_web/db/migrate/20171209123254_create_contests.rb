class CreateContests < ActiveRecord::Migration[5.1]
  def change
    create_table :contests do |t|
      #Contest's id which identify the contest uniquely
      t.string :cont_id
      #Contest's name that will be displayed to user
      t.string :name
      #Discription about the contest
      t.string :text
      #Starting date of contest
      t.time :start_date
      #Contest type
      #(sometimes different cont_id has same cont_type)
      t.string :cont_type
      #Contest update term (ms)
      t.integer :term
      #Status of contest (0:scheduled 1:in session 2:finished -1:ended unexpectedly)
      t.integer :stat

      #Users particiapte the contest (json format)
      t.text :users

      #template of input structure
      t.text :input_template
      #json structured data send to user
      t.text :data
      #view displayed to user
      t.text :view
      #Inputs from users
      t.text :inputs

      t.timestamps
    end
  end
end
