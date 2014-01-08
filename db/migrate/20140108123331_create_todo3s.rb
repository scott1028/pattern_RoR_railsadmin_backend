class CreateTodo3s < ActiveRecord::Migration
  def change
    create_table :todo3s do |t|
      t.string :label

      t.timestamps
    end
  end
end
