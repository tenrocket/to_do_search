class Task < ActiveRecord::Base

	belongs_to :person

	def self.start_date(start_date, end_date)
		where( 'due_date' < '#{end_date}' AND 'due_date' > '#{start_date}')
	end

end
