class CreateContInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :cont_infos do |t|
      t.string :cont_name
      t.integer :int_param
      t.timestamps
    end
  end
end
