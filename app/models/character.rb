# == Schema Information
#
# Table name: characters
#
#  id                 :integer          not null, primary key
#  name               :string
#  character_race_id  :integer
#  character_class_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#
# Indexes
#
#  index_characters_on_character_class_id  (character_class_id)
#  index_characters_on_character_race_id   (character_race_id)
#  index_characters_on_user_id             (user_id)
#

class Character < ApplicationRecord
  belongs_to :user
  belongs_to :character_race
  belongs_to :character_class
end
