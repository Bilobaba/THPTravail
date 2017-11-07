class Gossip < ApplicationRecord
  belongs_to :moussaillon

  validates :moussaillon, presence: true

end
