class BookingsController < ApplicationController
  def index
		@places = Place.all
  end

  def search
		@teleporters = Teleporter.where("departure = :dep_id AND destination = :dest_id", {dep_id: params[:departure_id], dest_id: params[:destination_id]})

		@teleporters.each do |t|
			t.departure = Place.find(t.departure).name
			t.destination = Place.find(t.destination).name
		end
		render 'search_without_result' if @teleporters.empty?
	end

	def show
		#debugger
		@teleporter = Teleporter.find(params[:id])
		@teleporter.departure = Place.find(@teleporter.departure).name
		@teleporter.destination = Place.find(@teleporter.destination).name
		@customers = Customer.joins(:teleporter).where("teleporters.id = :tel_id", {tel_id: params[:id]})
		render 'show_without_booking' if @teleporter.full?
	end
	
	def new_booking
	 	@teleporter = Teleporter.find(params[:id])
	end

	def create
		#debugger
		teleporter = Teleporter.find(params[:id])
		if params[:mail] != '' && params[:name] != ''
			customer = Customer.where("mail = :mail", {mail: params[:mail]})
			if !customer.empty?
				flash[:error] = "#{customer.name} already booked a travel, sorry."
				redirect_to new_booking_path(teleporter)
			else
				@customer = Customer.create!({:name => params[:name], :mail => params[:mail]})
	 			@booking = Booking.create!({:customer_id => @customer.id, :teleporter_id => params[:id]})
				flash[:notice] = "Congrats #{@customer.name}, your seat is book in the teleporter."
				redirect_to teleporter_path(teleporter)
			end
		else
			flash[:error] = "Please fill the form"
			redirect_to new_booking_path(teleporter)
		end
  end

end
