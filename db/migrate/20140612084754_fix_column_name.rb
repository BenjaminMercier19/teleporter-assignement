class FixColumnName < ActiveRecord::Migration
  def change
		rename_column :bookings, :teleporter, :teleporter_id
		rename_column :bookings, :customer, :customer_id
  end

end
