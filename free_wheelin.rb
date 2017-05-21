
# Project "Free Wheelin'" is a program that takes the amount of free time you have in between commitments (meetings, family time, etc) and figures out a place you can ride your bike to.  

# In the UI, we'll need the user to input:
#     **For the ride:**
#         Amount of time available
#         The kind of ride they want to go on (leisurely, moderate, workout, custom)
#         How much time they'd like for a buffer zones (includes time to get onto bike, and possible shower time afterward)
#         Amount of time at the location       
#     **Future Ride Setups:**
#         Places/landmarks they'd like to visit to be added to the list
#     **View the List of Destinations**
#         View the table
#     **Show the starting address for verification**
#         Possibly allow for option of new starting destination?
    

#methods:


# Create table of locations

#pull the location information

# add ability to add/delete locations

#New Location Table creation
#gems

require 'sqlite3'
require "faker"
db = SQLite3::Database.new("test.db")
db.results_as_hash = true

create_table = <<-SQL
    CREATE TABLE IF NOT EXISTS test(
        id INTEGER PRIMARY KEY,
        location VARCHAR(255),
        distance INT
    )
SQL

db.execute(create_table)

# class Wheels(minutes, current_location)

    # @minutes = minutes
    # @location = location

    def show_locations(db)
        landmarks = db.execute("SELECT * FROM test")
        landmarks.each do |locals|
            puts "#{locals['location']} is #{locals['distance']} miles away."
        end      
    end

    def location_maker(db, location, distance)
        db.execute("INSERT INTO test (location, distance) VALUES (?, ?)", [location, distance])
    end





# end

#### DRIVER CODE ####
show_locations(db)

# wheels = Wheels.new(minutes, location)

# 20.times do 
#     location_maker(db,Faker::Address.street_name, rand(10))
    
# end



