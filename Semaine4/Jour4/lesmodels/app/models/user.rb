class User < ApplicationRecord
  has_many :pins
  has_many :commentaires

  validates :pseudo, presence: true, length: { minimum: 5 }
end
