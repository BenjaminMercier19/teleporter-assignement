class BookingsController < ApplicationController
  def index
		@places = Place.all
  end

	def show
		debugger
		@teleporter = Teleporter.find(params[:id])
		@customers = Customer.joins(:teleporter).where("teleporters.id = :tel_id", {tel_id: params[:id]})
	end

  def search
		@teleporters = Teleporter.where("departure = :dep_id AND destination = :dest_id", {dep_id: params[:departure_id], dest_id: params[:destination_id]})

		@teleporters.each do |t|
			t.departure = Place.find(t.departure).name
			t.destination = Place.find(t.destination).name
		end
	end

	def new_booking
		 	
	end
end
