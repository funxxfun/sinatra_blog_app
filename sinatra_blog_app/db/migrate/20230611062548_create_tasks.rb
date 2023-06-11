class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :task_name
      t.text :status
      t.date :deadline
      t.timestamps null: false
    end
  end
end
