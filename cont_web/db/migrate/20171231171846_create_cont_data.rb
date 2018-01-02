class CreateContData < ActiveRecord::Migration[5.1]
  def change
    create_table :cont_data do |t|
      t.string :cont_id
      t.string :name
      t.integer :term
      t.integer :int_param
      
      t.timestamps
    end
  end
end
