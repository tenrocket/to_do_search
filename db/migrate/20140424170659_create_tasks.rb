class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :person_id
      t.boolean :complete
      t.date :due_date
      t.string :name
      t.string :description
    end
  end
end
