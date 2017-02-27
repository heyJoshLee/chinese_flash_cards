class User < ActiveRecord::Base
  has_secure_password validations: false
  has_deck :cards
  has_many :words, foreign_key: "user_id", class_name: "Card"
end