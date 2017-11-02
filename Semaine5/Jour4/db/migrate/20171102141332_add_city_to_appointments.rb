class AddCityToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_reference :appointments, :city, index: true
  end
end
