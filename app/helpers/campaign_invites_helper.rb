module CampaignInvitesHelper
  def campaign_invite_status(campaign_invite)
    if campaign_invite.pending
      'Pending'
    else
      content_tag(:i, '', class: 'fas fa-check')
    end
  end
end
