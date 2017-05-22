
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


    def show_locations(db)
        landmarks = db.execute("SELECT * FROM test")
        landmarks.each do |locals|
            puts "Location ##{locals['id']} is #{locals['location']}, and is #{locals['distance']} miles away."
        end      
    end

    def location_maker(db, location, distance)
        db.execute("INSERT INTO test (location, distance) VALUES (?, ?)", [location, distance])
    end

    def location_remover(db, idnumber)
        db.execute("DELETE FROM test WHERE id=(?)", [idnumber])
    end

    def location_finder(db, time, speed)
        time = time.to_f
        speed = speed.to_f
        max_distance = (((speed/60.0) * time)/2.0).to_f
        landmarks = db.execute("SELECT * FROM test WHERE distance<= #{max_distance}")
        landmarks.map do |locals|
            puts "You can ride to #{locals['location']} and back. It is #{locals['distance']} miles away."
        end      
    end

    def loc_adder(db)
        show_locations(db)
        puts "What place would you like to add?"
        location = gets.chomp
        puts "How many miles away is it?"
        distance = gets.chomp.to_f
        location_maker(db, location, distance)
        puts "Here is your updates list:"
        show_locations(db)
    end

    def loc_remover(db)
        show_locations(db)
        puts "What is the Location Number that you'd like to remove?"
        idnumber = gets.chomp.to_i
        location_remover(db, idnumber)
        puts "Here is your updated list:"
        show_locations(db)        
    end  

    def ride(db)
    puts "Let's plan a quick bike ride!"  
    puts "How many minutes do you have for a bike ride?"
    time = gets.chomp.to_f
    valid_input = false
        until valid_input 
            puts "How intense would you like your ride to be?  (L)eisurely, (M)oderate, (W)orkout, or (C)ustom?"
                intensity = gets.chomp.downcase
                    if intensity == "l"
                        puts "You've chosen a leisurely pace, which is roughly 8 mph."
                        speed = 8.0
                        valid_input = true
                    elsif intensity == "m"
                        puts "You've chosen a moderate pace, which is roughly 11 mph."
                        speed = 11.0
                        valid_input = true
                    elsif intensity == "w"
                        puts "You've chosen a workout ride, which is roughly 14 mph."
                        speed = 14.0
                        valid_input = true
                    elsif intensity == "c"
                        puts    "Please choose your average speed in MPH:"
                        speed = gets.chomp.to_f
                        valid_input = true
                    else
                        puts "I didn't understand what you typed.  Please try again."
                    end
            location_finder(db, time, speed)
        end
    end        


#### DRIVER CODE ####

puts "Welcome to Free Wheelin'!"
valid_input = false
until valid_input
puts "Would you like to (p)lan a ride, (l)ist all your locations, (a)dd to your list, or (r)emove from the list?"
    choice = gets.chomp.downcase
        if choice == 'p'
            ride(db)
            valid_input = true
        elsif choice == 'l'
            puts "Here is your current list of possible destinations:"
            show_locations(db)
            valid_input = true
        elsif choice == 'a'
            loc_adder(db)
            valid_input = true
        elsif choice == 'r'
            loc_remover(db)
            valid_input = true
        else
            puts "I don't understand.  Please try again."
        end
end
        

#### Testing Code ####

# def ride
#     puts "How many minutes do you have for a bike ride?"
#     time = gets.chomp.to_f
#     puts "How intense would you like your ride to be?  (L)eisurely, (M)oderate, (W)orkout, or (C)ustom?"
#         intensity = gets.chomp.downcase
#             if intensity == "l"
#                 puts "You've chosen a leisurely pace, which is roughly 8 mph."
#                 speed = 8.0
#             elsif intensity == "m"
#                 puts "You've chosen a moderate pace, which is roughly 11 mph."
#                 speed = 11.0
#             elsif intensity == "w"
#                 puts "You've chosen a workout ride, which is roughly 14 mph."
#                 speed = 14.0
#             elsif intensity == "c"
#                 puts    "Please choose your average speed in MPH:"
#                 speed = gets.chomp.to_f
#             else
#                 puts "I didn't understand what you typed.  Please try again."
#             end
    
#         location_finder(db, time, speed)
#  end



## TEST CODE ##

# wheels = Wheels.new($db, 45, 13)

#location_maker(db, "900 North", 0)

# wheels.show_locations(db)
# location_finder(db, time, speed)

# 20.times do 
#     location_maker(db,Faker::Address.street_name, rand(10))
    
# end



