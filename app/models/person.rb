class Person < ActiveRecord::Base

	has_many :tasks

	mount_uploader :person_photo, PersonPhotoUploader
	
end
