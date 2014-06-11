class BookingsController < ApplicationController
  def index
		debugger
		@places = Place.all

  end
end
