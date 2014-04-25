class PeopleController < ApplicationController

	def index
		@people = Person.all
	end

	def new
		@new_person = Person.new
	end

	def create
		@new_person = Person.new(person_params)
		if @new_person.save
			redirect_to people_path
		else
			redirect_to new_person_path
		end
	end

	def show
		@person = Person.find(params[:id])
		@person_id = @person.id
		@tasks = Task.where('tasks.person_id = ?' , @person_id)
		
	end

	def edit
		@person = Person.find(params[:id])
	end

	def update
		@person = Person.find(params[:id])
		if @person.update_attributes(person_params)
			redirect_to people_path
		end
	end

	def destroy
		@person = Person.find(params[:id])
		if @person.destroy
			redirect_to people_path
		end
	end

	def change_availablity
		@person = Person.find(params[:id])
		if @person.available 
			val = false
		else
			val = true
		end
		@person.update_attributes(:available => val)
		redirect_to person_path(params[:id])
	end

	private

	def person_params
		params.require(:person).permit!
	end
end
