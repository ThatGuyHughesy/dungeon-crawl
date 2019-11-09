class CampaignInviteMailer < ApplicationMailer
  default from: 'invites@jester.com'

  def campaign_invite_email
    @campaign_invite = params[:campaign_invite]
    @url = params[:invite_url]
    mail(to: @campaign_invite.email, subject: 'Your Adventure Awaits!')
  end
end
