class Pin < ApplicationRecord
  validates :url, presence: true
  belongs_to :user
  validates :user, presence: true
  has_many :commentaires
end
