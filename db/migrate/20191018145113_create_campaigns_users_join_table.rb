class CreateCampaignsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :campaigns, :users do |t|
      t.index :campaign_id
      t.index :user_id
    end
  end
end
