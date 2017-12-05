class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|

      t.string :name , :null => false
      t.string :notes , :null => false

      t.timestamps
    end
  end
end
