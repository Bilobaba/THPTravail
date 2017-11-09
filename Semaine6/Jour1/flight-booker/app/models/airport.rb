class Airport < ApplicationRecord
  has_many  :from_flights, foreign_key: :departure_airport_id, class_name: :Flight
  has_many :to_flights, foreign_key: :arrival_airport_id, class_name: :Flight

  has_many :to_airports, through: :from_flights, source: :arrival_airport
  has_many :from_airports, through: :to_flights, source: :departure_airport
end
