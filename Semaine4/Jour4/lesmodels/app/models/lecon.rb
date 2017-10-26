class Lecon < ApplicationRecord
  belongs_to :cour
  validates :titre, presence: true,
                    length: { minimum: 5 }
  validates :body, presence: true,
                    length: { minimum: 20 }
end
