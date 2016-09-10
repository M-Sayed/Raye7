Group.create([
  { name: "Axis" },
  { name: "Allies​"}
])

Place.create([
  { name: "Maadi", longitude: "1234", latitude: "5678"},
  { name: "Zamalek", longitude: "1234", latitude: "5678"},
  { name: "Smart Village", longitude: "1234", latitude: "5678"},
  { name: "New Cairo", longitude: "1234", latitude: "5678"}
])


# User.create
# (first_name: "Mahmoud", last_name: "Sayed", group_id: Group.first.id, 
# home_place_id: Place.first.id, work_place_id: Place.second.id, phone: "01017131693")
# Trip.create
# (onwer_id: u.id, source_id: u.home_place.id, destenation_id: u.work_place.id, 
# seats: 3, departure_time: Time.now)