class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :label
      t.text :summary

      t.timestamps
    end
  end
end
