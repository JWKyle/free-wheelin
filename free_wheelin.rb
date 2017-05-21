
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

class Wheels(minutes, current_location)

    @minutes = minutes
    @location = location

    def show_locations
        #####
    end

    def location_maker(db, name, location)
        db.execute("INSERT INTO test (name, location) VALUES (?, ?)", [name, location])
    end





end

#### DRIVER CODE ####

wheels = Wheels.new(minutes, location)

20.times do 
    wheels.location_maker(db, )
    
end



