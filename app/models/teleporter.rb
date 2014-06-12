class Teleporter < ActiveRecord::Base
	has_many :bookings

	def count_remaining_seat
		3 - bookings.size
	end

	def full?
		bookings.size == 3
	end

end
