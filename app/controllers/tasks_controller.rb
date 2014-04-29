class TasksController < ApplicationController

	def index
		@tasks = Task.all
	end

	def new
		@new_task = Task.new
	end

	def create
		@new_task = Task.new(task_params)
		if @new_task.save
			redirect_to tasks_path
		else
			redirect_to new_task_path
		end
	end

	def show
		@task = Task.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		if @task.update_attributes(task_params)
			redirect_to tasks_path
		end
	end

	def destroy
		@task = Task.find(params[:id])
		if @task.destroy
			redirect_to tasks_path
		end
	end

	def search
		@tasks = Task.search(params[:search])
		render :index 
	end

		def change_complete_status
		@task = Task.find(params[:id])
		if @task.complete
			val = false
		else
			val = true
		end
		@task.update_attributes(:complete => val)
		redirect_to :back
	end



	private

	def task_params
		params.require(:task).permit!
	end
end
