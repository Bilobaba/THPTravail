class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :duration
      t.date :departure_date
      t.references :departure_airport, references: :airports
      t.references :arrival_airport, references: :airports

      t.timestamps
    end
  end
end
