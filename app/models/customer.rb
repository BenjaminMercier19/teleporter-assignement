class Customer < ActiveRecord::Base
	has_one :booking
	has_one :teleporter, through: :booking
end
