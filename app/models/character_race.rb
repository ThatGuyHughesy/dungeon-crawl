# == Schema Information
#
# Table name: character_races
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  age         :string
#  alignment   :string
#  size        :string
#  speed       :string
#  languages   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CharacterRace < ApplicationRecord
end
