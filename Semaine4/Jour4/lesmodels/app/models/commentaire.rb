class Commentaire < ApplicationRecord

  belongs_to :user
  validates :user, presence: true

  belongs_to :pin
  validates :pin, presence: true

  validates :texte, presence: true, length: { minimum: 5 }

end
