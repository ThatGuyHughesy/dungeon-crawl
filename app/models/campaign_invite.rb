# == Schema Information
#
# Table name: campaign_invites
#
#  id           :integer          not null, primary key
#  campaign_id  :integer          not null
#  sender_id    :integer
#  recipient_id :integer
#  pending      :boolean
#  accepted     :datetime
#  email        :string
#  token        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_campaign_invites_on_campaign_id  (campaign_id)
#  index_campaign_invites_on_token        (token) UNIQUE
#

# TODO make email unique for campaign
class CampaignInvite < ApplicationRecord
  belongs_to :campaign
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User', optional: true

  before_create :generate_token

  private

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.campaign_id, Time.now, rand].join)
  end
end
