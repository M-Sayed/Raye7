# Challenge Description

In *Raye7*, Users who have cars can create trips, specifying the number of empty seats in their cars, departure time, source and destination.
Other users can join them and preserve those empty seats.
Users who need a pickup can only see trips with source and destination that match their home and work places,  But there is a safety condition, Users who need a pickup must be in the same group with users who created the trip.

**A scenario to explain the behavior is as follows:**

User A in group G1 posted a trip from his home place to his work place, another user B in group G1 checked the app for available trip, B’s home and work place are the same as A’s so user B can see this trip and he is able to join it.
We need to create a JSON API to handle this scenario.

Create the following resources:

* User
  - First Name
  - Last Name
  - Phone Number
  - Group
  - Home Place (Place)
  - Work Place (Place)

* Group
   - Name [Unique]

* Place
   - Name [Unique]
   - Longitude
   - Latitude

* Trip
   - Driver (User)
   - Source (Place)
   - Destination (Place)
   - DepartureTime
   - Seats

Add the suitable validations for model attributes and create and appropriate join table to connect trips with users who want to join it.

Before working on controllers seed the groups table with these two groups Axis and Allies, and seed the places table with 4 places Maadi, Zamalek, Smart Village, and New Cairo.
Feel free to set the longitude and latitude with any values.

Create the following controllers with end points:

* Groups Controller:
  - GET /groups
    : To list all available groups
  - POST /groups
    : To register a new group
    : Example for JSON to be sent: {“name”: “Axis”}

* Places Controller:
  - GET /places
    : To list all available places
  - POST /places
    : To add a new place
    : Example for JSON to be sent: {name: “Maadi”, “latitude”: 29.959236, “longitude”: 31.2248074 }

* Users Controller:
  - POST /user
    : To register a new user with json data
    : Example for JSON to be sent: {“first_name”: “John”, “last_name”: “Doe”, “phone_number”: “01001010100”, “group_id”: 1, “home_place_id”: 1, “work_place_id”: 2 }

* Trips Controller:
  - GET /trips?user_id=X
    : To list the available trips to join for the user with id X
  - POST /trips
    : To create a trip for user
    : Example for JSON to be sent: { “driver_id”: 3, “source_id”: 1, “destination_id”: 2, “departure_time”: “20 08 2016 10:00”, “seats”: 3}
  - POST /trips/Y/join
    : To be called by to join trip with id Y
    : Example for JSON to be sent: { “user_id”: 1 }
  - POST /trips/Y/leave
    : To be called by a user who wants to leave a trip with id Y he joined before
    : Example for JSON to be sent: { “user_id”: 1 }
  - GET /trips/Y
    : To show the trip with the joined users
  - DELETE /trips/Y?user_id=X
    : To delete a trip posted by user with id X

If the user is creating a resource respond with the created object in json format, and make sure that you are
sending the right status codes.


Requirements:
- Use latest stable Ruby
- Use Rails 4.2.6+
- Use Postgresql or MySQL for DBMS

Deliverable:
1. Source Code on a github/bitbucket repo
2. Unit Tests for models and controllers using RSpec and Shoulda Matchers
3. Request Tests [EXTRA]