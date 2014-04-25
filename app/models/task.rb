class Task < ActiveRecord::Base

	belongs_to :person

	mount_uploader :task_photo, TaskPhotoUploader

	scope :task_completed, -> {where(complete: true)}
	scope :task_incomplete, -> {where(complete: false)}
	
	def self.start_date(start_date)
		where('due_date > ?' , start_date)
	end

	def self.end_date(end_date)
		where('due_date < ?' , end_date)
	end

	def self.person(person)
		joins(:person).where('people.name Like ?', person)
	end

	def self.search(params)
		
		user_input = params[:search]
		start_date = params[:start_date]
		end_date = params[:end_date]
		person = params[:person]
		task_completed = params[:task_completed]
		search = Task.all

		if person.present? 
			 search = search.person(person)
		end

		if task_completed.present?
				if task_completed == "true"
					search = search.task_completed
				else
					search = search.task_incomplete
				end
		end

		if start_date.present?
				search = search.start_date(start_date)
			end

		if end_date.present?
			search = search.end_date(end_date)
		end

		if user_input != " "
				search = search.where('tasks.name Like ?' , "%#{user_input}%" )
		end

		
	end

end
