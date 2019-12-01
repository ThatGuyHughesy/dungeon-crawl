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

require 'test_helper'

class CampaignInviteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
