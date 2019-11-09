class CreateCampaignInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :campaign_invites do |t|
      t.references :campaign, null: false, foreign_key: true
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :pending
      t.datetime :accepted
      t.string :email
      t.string :token, index: { unique: true }

      t.timestamps
    end
  end
end
