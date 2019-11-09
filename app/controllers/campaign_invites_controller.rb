# frozen_string_literal: true

class CampaignInvitesController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @campaign_invites = @campaign.campaign_invites
  end

  def create
    @campaign_invite = CampaignInvite.new(campaign_invite_params)
    @recipient = User.find_by(email: @campaign_invite.email)
    unless @recipient.nil?
      @campaign_invite.recipient_id = @recipient.id
    end
    if @campaign_invite.save
      # TODO remove this the DB updates here: we should direct existing users to a campaigns homepage. Once they click the link and go to that page, the logic to add them to the campaign will occur
      if !@recipient.nil?
        @campaign_invite.pending = false
        @campaign_invite.accepted = Time.now
        @campaign_invite.save
        @campaign = Campaign.find(@campaign_invite.campaign_id)
        @campaign.users << @recipient

        CampaignInviteMailer.with(
          campaign_invite: @campaign_invite,
          invite_url: campaigns_url(
            campaign_invite_token: @campaign_invite.token
          )
        ).campaign_invite_email.deliver_later
      else
        CampaignInviteMailer.with(
          campaign_invite: @campaign_invite,
          invite_url: new_user_registration_url(
            campaign_invite_token: @campaign_invite.token
          )
        ).campaign_invite_email.deliver_later
      end

      redirect_to campaign_campaign_invites_path(
                    @campaign_invite.campaign_id
                  ), notice: 'Invite sent.'
    else
      redirect_to campaign_campaign_invites_path(@campaign_invite.campaign_id)
    end
  end

  private

  def campaign_invite_params
    params.require(:campaign_invite).permit(
      :email,
      :campaign_id,
      :sender_id,
      :pending
    )
  end
end
