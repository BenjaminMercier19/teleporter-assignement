class BookingsController < ApplicationController
  def index
		#debugger
		@places = Place.all
		#@teleporters = Teleporter.all
  end

  def search
		debugger
		@teleporters = Teleporter.where("departure = :dep_id AND destination = :dest_id", {dep_id: params[:departure_id], dest_id: params[:destination_id]})

		@teleporters.each do |t|
			t.departure = Place.find(t.departure).name
			t.destination = Place.find(t.destination).name
		end
	end
end
