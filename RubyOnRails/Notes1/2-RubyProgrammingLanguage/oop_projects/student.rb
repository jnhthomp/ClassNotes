

# in order to use the methods in HashPass we have to require (import) it
require_relative '../hash_pass'

# To create a class start by declaring a class and naming it
# Naming MUST start with a capital letter
# Close the class with and "end" tag
class Student
    # using include hashpass in the object constructor (class) it gives each object individual access to it's methods
    include HashPass
    attr_accessor :first_name, :last_name, :email, :username, :password
    # This can be used to restrict writing to certain variables
    # attr_reader :username

    @first_name
    @last_name
    @email
    @username 
    @password

    # This is a method that needs to be included in order to initialize the objects attribtues
    def initialize(firstname, lastname, email, username, password)
        @first_name = firstname
        @last_name = lastname
        @email = email
        @username = username
        @password = password
    end
    

    ########### NOT THE BEST WAY TO DO THIS. SEE attr_accessor above############
    ## This is how you define a setter in Ruby
    ## Notice the equals sign in the function definition
    ## def first_name=(name)
    ##     @first_name = name
    ## end
    #
    ## def first_name
    ##     @first_name
    ## end
    #########################################################################
    # This function will be output by default when an instance is called

    # This is what you would do if you had an attribute set in attr_reader
    # Because you have to initialize the value for the created object with a function
    # def set_username
    #     @username = "jonah1"
    # end
    
    def to_s
        "First name: #{@first_name}, Last name: #{@last_name}, Email: #{@email}Username: #{@username}, Password: #{@password}"
    end
end

# When you create a new object and output without to_s definded it will out put a hash
# jonah = Student.new("Jonah", "Thompson", "test@email.com", "Jonah1", "PasswordJonah")

# delaney = Student.new("Delaney", "Thompson", "test2@email.com", "Delaney1", "PasswordDelaney")
# puts jonah

# # This won't work without a method to set the values of the object
# This is how you would have to do it if there was no initialize method in the class
# jonah.first_name = "Jonah"
# jonah.last_name = "Thompson"
# jonah.email = "test@email.com"
# This is how you would set the username if it was in attr_reader
# jonah.set_username



# # puts jonah.first_name
# # puts jonah.last_name
# # puts jonah.email
# # puts jonah.set_username

# puts jonah
# puts delaney

# jonah.first_name = delaney.first_name
# puts "Jonah is altered"
# puts jonah.first_name

jonah = Student.new("Jonah", "Thompson", "test@email.com", "jonahusr", "jonahpass")

hashed_password = jonah.create_hash_digest(jonah.password)
puts hashed_password