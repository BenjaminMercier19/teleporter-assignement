# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
  Place.create(name: "Place ##{i}")
end

@places = Place.count

50.times do |i|
	$dep_id = Random.new.rand(1..Place.count)
	$dest_id = Random.new.rand(1..Place.count)
	while $dest_id == $dep_id  do
		$dest_id = Random.new.rand(1..Place.count)
	end
	Teleporter.create(number: rand(1000..10000), departure: $dep_id, destination: $dest_id)
end


Customer.create([{name: 'jean', mail: 'jean.j@fake.com'}, 
									{name: 'pierre', mail: 'pierre.j@fake.com'}, 
									{name: 'bob', mail: 'bob.j@fake.com'},
									{name: 'alex', mail: 'alex.j@fake.com'}, 
									{name: 'claire', mail: 'claire.j@fake.com'},
									{name: 'alice', mail: 'alice.j@fake.com'}, 
									{name: 'jenny', mail: 'jenny.j@fake.com'},
									{name: 'anne', mail: 'anne.j@fake.com'}, 
									{name: 'daniel', mail: 'daniel.j@fake.com'}])

Booking.create([{number: rand(1000..10000), customer_id: 1, teleporter_id: 1},
								{number: rand(1000..10000), customer_id: 2, teleporter_id: 1},
								{number: rand(1000..10000), customer_id: 3, teleporter_id: 1},
								{number: rand(1000..10000), customer_id: 4, teleporter_id: 2},
								{number: rand(1000..10000), customer_id: 5, teleporter_id: 7},
								{number: rand(1000..10000), customer_id: 6, teleporter_id: 2},
								{number: rand(1000..10000), customer_id: 7, teleporter_id: 6},
								{number: rand(1000..10000), customer_id: 8, teleporter_id: 7},
								{number: rand(1000..10000), customer_id: 9, teleporter_id: 7}])

