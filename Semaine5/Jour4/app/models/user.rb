class User < ApplicationRecord
  has_many :tweets
  has_and_belongs_to_many :followers, class_name: "User"
  has_and_belongs_to_many :follings, class_name: "User"
  has_and_belongs_to_many :private_messages
end
