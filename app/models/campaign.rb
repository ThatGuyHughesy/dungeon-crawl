# == Schema Information
#
# Table name: campaigns
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Campaign < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :campaign_invites, dependent: :delete_all
end
