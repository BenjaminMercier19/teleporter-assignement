class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :number
      t.integer :customer
      t.integer :teleporter

      t.timestamps
    end
  end
end
