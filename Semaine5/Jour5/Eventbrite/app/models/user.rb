class User < ApplicationRecord
  validates :name, presence: { message: 'Pas de blanc svp' }, uniqueness: { message: 'Pas de doublon' }
  has_many :created_events, class_name: :Event, foreign_key: :creator_id

  has_and_belongs_to_many :attended_events, class_name: :Event
end
