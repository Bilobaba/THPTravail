class Cour < ApplicationRecord
  has_many :lecons
  validates :titre, presence: true, uniqueness: true,
                    length: { minimum: 5 }
  validates :description, presence: true,
                    length: { minimum: 20 }

end
