class CreateOfferStateTransitions < ActiveRecord::Migration
  def change
    create_table :offer_state_transitions do |t|
      t.references :offer
      t.references :user 
      t.string :event
      t.string :from
      t.string :to
      t.string :state_message 
      t.timestamp :created_at
    end
    add_index :offer_state_transitions, :offer_id
  end
end
