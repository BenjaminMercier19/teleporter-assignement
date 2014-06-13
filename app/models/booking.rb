class Booking < ActiveRecord::Base
	belongs_to :teleporter
	belongs_to :customer
end
