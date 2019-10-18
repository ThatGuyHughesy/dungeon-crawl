class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :update, :destroy]

  # GET /campaigns
  def index
    @campaigns = Campaign.all
    render json: @campaigns.as_json, status: 200
  end

  # POST /campaigns
  def create
    @campaign = Campaign.create(campaign_params)
    render json: @campaign.as_json, status: 200
  end

  # GET /campaigns/:id
  def show
    render json: @campaign.as_json, status: 200
  end

  # POST /campaigns/:id
  def update
    @campaign.update(campaign_params)
    head :no_content
  end

  # DELETE /campaigns/:id
  def destroy
    @campaign.destroy
    head :no_content
  end

  private

  def campaign_params
    params.permit(:name, :description)
  end

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end
end
