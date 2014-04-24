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

	private

	def person_params
		params.require(:person).permit!
	end
end
