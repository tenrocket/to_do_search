class AddPersonPhotoToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :person_photo, :string
  end
end
