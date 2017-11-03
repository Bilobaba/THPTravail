class Tweet < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_and_belongs_to_many :likers, class_name: "User"
end
