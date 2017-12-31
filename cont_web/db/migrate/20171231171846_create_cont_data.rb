class CreateContData < ActiveRecord::Migration[5.1]
  def change
    create_table :cont_data do |t|
      t.string :cont_name
      t.integer :int_param
      
      t.timestamps
    end
  end
end
