class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :cities, through: :appointments
  has_and_belongs_to_many :deal_withs, :class_name => "Specialty"
end
