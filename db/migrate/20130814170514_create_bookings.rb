class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :what
      t.string :state
      t.string :state_message

      t.timestamps
    end
  end
end
