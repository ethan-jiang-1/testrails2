class CreateBookingStateTransitions < ActiveRecord::Migration
  def change
    create_table :booking_state_transitions do |t|
      t.references :booking
      t.string :event
      t.string :from
      t.string :to
      t.string :state_message
      t.timestamp :created_at
    end
    add_index :booking_state_transitions, :booking_id
  end
end
