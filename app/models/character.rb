class Character < ApplicationRecord
  belongs_to :user
  belongs_to :character_race
  belongs_to :character_class
end
