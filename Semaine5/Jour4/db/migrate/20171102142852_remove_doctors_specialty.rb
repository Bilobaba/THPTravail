class RemoveDoctorsSpecialty < ActiveRecord::Migration[5.1]
  def change
    remove_column :doctors, :specialty
  end
end
