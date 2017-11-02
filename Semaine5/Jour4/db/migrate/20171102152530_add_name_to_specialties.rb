class AddNameToSpecialties < ActiveRecord::Migration[5.1]
  def change
    add_column :specialties, :name, :string
  end
end
