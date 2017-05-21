
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
# time = 45
# speed = 13


    def show_locations(db)
        landmarks = db.execute("SELECT * FROM test")
        landmarks.each do |locals|
            puts "#{locals['location']} is #{locals['distance']} miles away."
        end      
    end

    def location_maker(db, location, distance)
        db.execute("INSERT INTO test (location, distance) VALUES (?, ?)", [location, distance])
    end

    def location_finder(db, time, speed)
        #Need to have it iterate through the distance column only"
        time = time.to_f
        speed = speed.to_f
        max_distance = (((speed/60.0) * time)/2.0).to_f
        # time_leg = 
        landmarks = db.execute("SELECT * FROM test WHERE distance<= #{max_distance}")
        landmarks.map do |locals|
            puts "You can ride over to #{locals['location']}. It is #{locals['distance']} miles away."
        end      
    end        



# end



# end

#### DRIVER CODE ####

puts "Welcome to Free Wheelin'!"
puts "How much time do you have for a bike ride?"
time = gets.chomp.to_f
puts "How intense would you like your ride to be?  (L)eisurely, (M)oderate, (W)orkout, or (C)ustom?"
    intensity = gets.chomp.downcase
    # val_input = false
    # until val_input
        if intensity == "l"
            puts "You've chosen a leisurely pace, which is roughly 8mph."
            speed = 8.0
            # val_input = true
        elsif intensity == "m"
            puts "You've chosen a moderate pace, which is roughly 11mph."
            speed = 11.0
            # val_input = true
        elsif intensity == "w"
            puts "You've chosen a workout ride, which is roughly 14mph."
            speed = 14.0
            # val_input = true
        elsif intensity == "c"
            puts    "Please choose your average speed in MPH:"
            speed = gets.chomp.to_f
            # val_input = true
        else
            puts "I didn't understand what you typed.  Please try again."
        end
    # end

location_finder(db, time, speed)



## TEST CODE ##

# wheels = Wheels.new($db, 45, 13)

#location_maker(db, "900 North", 0)

# wheels.show_locations(db)
# location_finder(db, time, speed)

# 20.times do 
#     location_maker(db,Faker::Address.street_name, rand(10))
    
# end



