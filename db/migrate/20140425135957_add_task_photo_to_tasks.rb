class AddTaskPhotoToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :task_photo, :string
  end
end
