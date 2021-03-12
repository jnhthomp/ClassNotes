
#===================================================#
#       13. Introduction to Section 2 and Ruby      #
#===================================================#

# Say Hello World in multiple ways

  # Simple put string
# Short for put string
# puts "Hello World"

# Doesn't return nill, actually returns given arguement
# p "Hello World"

# Doesn't include new line at end like puts without \n
# print "Hello World\n"

  # Using a variable
# greeting  = "Hello World"
# puts greeting

  # Using a method
# def say_hello(thing_to_say)
#   puts thing_to_say
# end
#
# say_hello "Hello World"


#===============================#
#       15. Teacher Notes:      #
#===============================#

# Ruby resource:
#
# www.ruby-lang.org
#
# To view current directory:
#
# pwd
#
# To create a directory:
#
# mkdir directory_name
#
# To move into a directory:
#
# cd directory_name
#
# **This command above will only work if the directory_name is listed as one of the folders within the current directory
#
# To list all directories and files within current directory:
#
# ls
#
# To list all directories and files within current directory including hidden files:
#
# ls -a
#
# To move out of a directory (1 level up the tree):
#
# cd ..
#
# To print hello world to the console or output:
#
# puts "Hello World!"
#
# In repl you can simply click the play button. But in cloud9, AWS cloud9 or your local environment, first ensure you are in the directory which includes the file where you have written the hello world program and then run it using the command below (this is assuming the filename is playground.rb)
#
# From the command line:
#
# ruby playground.rb
#
# To create a variable called hello and print the value of hello:
#
# hello = "Hello World!"
# puts hello
# The following is the structure of a method in Ruby, things to remember are the keywords def and end:
#
# def methodname
#   # contents of method
# end
# To write a method to say hello world you can write:
#
# def say_hello
#   puts "Hello World!"
# end
# Then call the method by simply referencing the name:
#
# say_hello
#
# Updated hello method:
#
# def say_hello(thing_to_say)
#   puts thing_to_say
# end
# To make this method say things:
#
# say_hello "My name is Mashrur"
#
# say_hello "Welcome to the Complete Ruby on Rails Developer Course"
#
# say_hello "Check it out this prints anything I want"





#=========================================#
#       16. Working with Strings pt1      #
#=========================================#

# String concatenation
# Strings can be stored in either single or double quotes
# first_name = "Jonah"
# last_name = 'Thompson'
# puts first_name + " " + last_name
#
# # String Interpolation
# # This only works if the strings are stored in double quotes
# puts "My first name is #{first_name} and my last name is #{last_name}"



#============================================#
#       17. pt2 Getting Input From User      #
#============================================#

# #outputs string "What is your first name?"
# puts "What is your first name?"
# # Gets user input and assigns entry to first_name
# # .chomp method removes new line character from the end of string
# first_name = gets.chomp
#
# puts "What is your last name?"
# last_name = gets.chomp
#
# puts "Thank you, you said your first name is #{first_name} and your last name is #{last_name}"


# puts "Enter a number to multiply by 2"
# input = gets.chomp
#
# # Input by user is received as a string
# # Input must be converted to integer before using math
# # puts input * 2 # => concatenates inputted number
# puts input.to_i * 2 # => converts to integer then multiply by 2


### CHALLENGE ###
# Take first name and last name
# print out full name
# print out full name reversed
# print number of characters in name (not counting space)
#################


# puts "What is your first name?"
# first_name = gets.chomp
# puts "What is your last name?"
# last_name = gets.chomp
#
# puts "Your full name is #{first_name} #{last_name}"
# puts "Your full name reversed is #{last_name.reverse} #{first_name.reverse}"
# puts "Your name has #{(first_name + last_name).length}"


### Teacher Solution ###
# puts "Enter your first name"
# first_name = gets.chomp
# puts "Enter your last name"
# last_name = gets.chomp
# full_name = first_name + " " + last_name
# puts "Your full name is #{full_name}"
# puts "Your full name reversed is #{full_name.reverse}"
# puts "Your name has #{full_name.length -1}"


#===============================#
#       18. Teacher Notes:      #
#===============================#

# To start irb console:
#
# irb
#
# To exit the console:
#
# exit
#
# String concat structure:
#
# String1 + String2
#
# String1 + " " + String2 + String3
#
# To find out what class the object belongs to:
#
# Variable_name.class
#
# 1.class # This will return integer, signifying that 1 is of type integer
#
# To find out methods available to an object:
#
# objectname.methods
#
# Some methods that can be used on objects:
#
# objectname.nil?
#
# objectname.empty?
#
# objectname.length
#
# objectname.reverse
#
# String interpolation (remember has to be within double quotes):
#
# name = "Mashrur"
#
# "My name is #{name}"
#
# **This will print out the value of name in the line "My name is...."
#
# To escape the evaluation of #{variablename} within a String, prepend with a \:
#
# \#{variablename}
#
# To get input from the command line use the following method:
#
# gets.chomp
#
# To assign the input to a variable so it can be referenced later on:
#
# variablename = gets.chomp





#======================================#
#       20. Working With Numbers       #
#======================================#

# # Basic math
# puts 1 + 2
# # => 3
#
# # Can also use variables
# x = 1
# y = 2
# puts x + y
# # => 3
#
# # You CAN "multiply" string * number
# puts "5" * 5
# # => "55555"
#
# # But you CAN'T multiply a string * string
# puts "5" * "5"
# # => Error: Wtf dude? What are you trying to do?
#
# # You CAN'T multiply a number * string
# puts 5 * "5"
# # => Error: What did you think was going to happen here?
#   # These two would work if you converted the second int to a string
# puts "5" * "5".to_i
# # => "55555"
# puts 5 * "5".to_i
# # => 25
# #(If you try to convert a string that is not a number ("Hello") => 0)
#
# # int.times is a method to repeat something
# # specify the number of times you want to do something
# # then use a code block to say what should happen {}
# 3.times{print "Hi"}
# # => "HiHiHi"
#
# # or
# 3.times{puts "Hi"}
# # => "Hi"
# # => "Hi"
# # => "Hi"
#
# # random number uses rand(int)
# # use int to define (non-inclusive) upper limit for random number
# # Will return a number < 1 if not specified
# 3.times{puts rand(10)}
# # => 4
# # => 8
# # => 5

###   CHALLENGE   ###
# puts "Simple Calculator"
# 25.times{print "*"}
# puts "\nEnter first number:"
# num_1 = gets.chomp.to_f
# puts "Enter second number:"
# num_2 = gets.chomp.to_f
# puts "The first number multiplied by the second number is #{num_1 * num_2}"
# puts "The first number divided by the second number is #{num_1 / num_2}"
# puts "The remainder of dividing the first number by the second number is #{num_1 % num_2}"
# puts "The first number plus the second number is #{num_1 + num_2}"
# puts "The first number minus the second number is #{num_1 - num_2}"



### Teacher Solution  ###

# puts "Simple calculator"
# 20.times { print "-" }
# puts
# puts "Please enter your first number"
# first_number = gets.chomp
# puts "Please enter your second number"
# second_number = gets.chomp
# puts "The first number multiplied by the second number is: #{first_number.to_f * second_number.to_f}"
# puts "The first number divided by the second number is: #{first_number.to_f / second_number.to_f}"
# puts "The first number subtracted from the second number is: #{second_number.to_f - first_number.to_f}"
# puts "The first number added to the second number is: #{second_number.to_f + first_number.to_f}"
# puts "The first number mod the second number is: #{first_number.to_f % second_number.to_f}"






#===============================#
#       21. Teacher Notes:      #
#===============================#

# To add and display the value of 1 + 2:
#
# puts 1 + 2
#
# Different operations:
#
# 1 + 2
#
# 1 * 2
#
# 1 / 2
#
# 1 - 2
#
# 1 % 2
#
# To indicate a number is a float instead of an integer include a . in the number:
#
# 20 is an integer, 20.0 is a float
#
# or
#
# 20.to_f
#
# Methods you can use:
#
# object.odd?
#
# 22.odd?
#
# object.even?
#
# 22.even?
#
# Comparisons:
#
# a == b
#
# 1 == 2
#
# 3 == 3
#
# 5 < 2
#
# 2 <= 5
#
# 5 > 2
#
# 5 && 6
#
# 5 || 6
#
# Generate a random number between 0 and less than 10:
#
# rand(10)
#
# To convert an string object to integer:
#
# objectname.to_i
#
# "5".to_i
#
# To convert an object to string:
#
# objectname.to_s
#
# 5.to_s




#=====================================================#
#       23. Brief Look at Comparison Operators        #
#=====================================================#


# ==  # => Equals (does type coercion)
  # Use .eql? for strict comparison (=== in js)
# !=  # => NOT equals
# >   # => Greater than
# <   # => Less than




#========================#
#       24. Methods      #
#========================#

# Use methods to group tasks and computations
# In ruby the last evaluated method is what is returned (implied)
# You can specify a return with "return" keyword (like js)
# Methods must be defined before they are called

# puts "Simple Calculator"
# 25.times{print "*"}
# puts "\nEnter first number:"
# num_1 = gets.chomp.to_f
# puts "Enter second number:"
# num_2 = gets.chomp.to_f
#
# def multiply(num_1, num_2)
#   num_1 * num_2
# end
#
# def divide(num_1, num_2)
#   num_1 / num_2
# end
#
# def subtract(num_1, num_2)
#   num_1 - num_2
# end
#
# def add(num_1, num_2)
#   num_1 + num_2
# end
#
# def mod(num_1, num_2)
#   num_1 % num_2
# end
#
# # Multiply
# puts "The first number multiplied by the second number is: #{multiply(num_1, num_2)}"
#
# # Divide
# puts "The first number divided by the second number is: #{divide(num_1, num_2)}"
#
# # Subtract
# puts "The first number minus the second number is: #{subtract(num_1, num_2)}"
#
# # Add
# puts "The first number plust the second number is: #{add(num_1, num_2)}"
#
# # Mod
# puts "The remainder of dividing the first number by the second number is: #{mod(num_1, num_2)}"



#============================================#
#       25. Branching if/elsif/else/end      #
#============================================#

# && => and: both conditions must be true
# || => or: only one of the conditions must be true

# #if/else
# condition = false
# another_condition = false
# if !condition || another_condition
#   #execute some code
#   puts  "This evaluated to true"
# else
#   #execute some other code
#   puts  "This evaluated to false"
# end
# puts "lalala"
#
# name = "Jacks"
# if name == "Jonah"
#   puts "Welcome to the program, Jonah"
# elsif name == "Jack"
#   puts "Welcome to the program, Jack"
# else
#   puts "Welcome to the program, User"
# end

#*case is also an option in ruby but not discussed here


#  Homework
#    Let the user choose an operator
#    Tell them what they chose and the result of the calculation

# puts "Simple Calculator"
# 25.times{print "*"}
# puts "\nEnter first number:"
# num_1 = gets.chomp.to_f
# puts "Enter second number:"
# num_2 = gets.chomp.to_f
#
# def multiply(num_1, num_2)
#   num_1 * num_2
# end
#
# def divide(num_1, num_2)
#   num_1 / num_2
# end
#
# def subtract(num_1, num_2)
#   num_1 - num_2
# end
#
# def add(num_1, num_2)
#   num_1 + num_2
# end
#
# def mod(num_1, num_2)
#   num_1 % num_2
# end
#
# puts "What do you want to do?"
# puts "*     /     %     -     +"
# req = gets.chomp
# puts "You selected #{req}"
# if req == "*"
#   puts puts "The first number multiplied by the second number is: #{multiply(num_1, num_2)}"
# elsif req == "/"
#   puts "The first number divided by the second number is: #{divide(num_1, num_2)}"
# elsif req == "%"
#   puts "The remainder of dividing the first number by the second number is: #{mod(num_1, num_2)}"
# elsif req == "-"
#   puts "The first number minus the second number is: #{subtract(num_1, num_2)}"
# elsif req == "+"
#   puts "The first number plust the second number is: #{add(num_1, num_2)}"
# else
#   puts "Invalid request"
# end





#===============================#
#       26. Teacher Notes:      #
#===============================#

# Structure of an if condition:
#
# if condition
#   #execute logic
# end
# # variant
# if condition
#   #execute logic
# else
#   #execute different logic
# end
# # variant
# if condition
#   # execute logic
# elsif #different condition
#   # execute logic 2
# else
#   # execute logic 3
# end
# Method code samples:
#
# def multiply(first_number, second_number)
#   first_number.to_f * second_number.to_f
# end
#
# def divide(first_number, second_number)
#   first_number.to_f / second_number.to_f
# end
#
# def subtract(first_number, second_number)
#   second_number.to_f - first_number.to_f
# end
#
# def mod(first_number, second_number)
#   first_number.to_f % second_number.to_f
# end
# Branching execution code sample:
#
# puts "What do you want to do? 1) multiply 2) divide 3) subtract 4) find remainder"
# prompt = gets.chomp
# puts "Enter in your first number"
# first_number = gets.chomp
# puts "Enter in your second number"
# second_number = gets.chomp
# if prompt == '1'
#   puts "You have chosen to multiply #{first_number} with #{second_number}"
#   result = multiply(first_number, second_number)
# elsif prompt == '2'
#   puts "You have chosen to divide"
#   result = divide(first_number, second_number)
# elsif prompt == '3'
#   puts "You have chosen to subtract"
#   result = subtract(first_number, second_number)
# elsif prompt == '4'
#   puts "You have chosen to find the remainder"
#   result = mod(first_number, second_number)
# else
#   puts "You have made an invalid choice"
# end





#=====================================#
#       27. Arrays and Iterators      #
#=====================================#

# Arrays
# Ordered list of items/elements
# Maintains an index (starting at 0)
# a =[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
# p a.last # => 9


# Array methods
# Create an integer range between 2 numbers
# x = 0..9
# # puts x # => 1..100
# # puts x.class # => Range
# # p x.to_a # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
#
# # Shuffle/randomize an array
# x = x.to_a
# p x.shuffle
#
# # Save a value returned from a method in the original variable
# p x.reverse # => [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
# p x # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
#
# p x.reverse! # => [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
# p x # => [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
#
# # You can also make ranges with letters
# x = ("a".."d").to_a
# p x # => [a,b,c,d]
#
# # Add item at beginning of list
# x.unshift("Jonah")
# p x # => [Jonah, a, b, c, d]
#
# # Add item at end of list (only accepts 1 item)
# x.append("Jonah")
# p x # => [Jonah, a, b, c, d, Jonah]
#
# # Remove duplicate entries from array (will keep first entry)
# p x.uniq! # => [Jonah, a, b, c ,d]
#
# # See if an array is populated
# p x.empty? # => false
#
# # See if an array contains a specific item
# p x.include?("Jonah") # => true
# p x.include?("Thompson") # => false
#
# # Another way to add an item (can add multiple items)
# x = x.push("new item")
# p x # => [Jonah, a , b , c, d, new item]
#
# # Remove AND RETURN last item on the array
# y = x.pop
# p x # => [Jonah, a, b, c, d]
# p y # => "new item"
#
# # Combine all the array items into a string
# p x.join # => "Jonahabcd"
#
# # Combine with a seperator between each item
# x = x.join("-")
# p x # => "Jonah-a-b-c-d"
#
# # Create an array into a string based on a seperator
# x = x.split("-")
# p x # => [Jonah, a, b, c, d]
#
# # Quickly create an array out of given words
# z = %w(my name is jonah and this is great Ruby is amazing)
# p z
# # => [my, name, is, jonah, and, this, is, great, Ruby, is, amazing]
#
# # iterate over an array (traditional way)
# for i in z
#   print i + " "
# end
# puts
#
#
# #iterate over an array (Ruby prefered method)
# z.each do |i|
#   print i + " "
# end
# puts
#
# # Iterate over an array (Ruby prefered 1 line)
# z.each{|i|print i + " "}
# puts
# All three iterate over an array print:
# => my name is jonah and this is great Ruby is amazing

# z = (1..100).to_a.shuffle
# # Goes through z array and returns items where condition is true
# p z.select{|i| i.odd?}





#===============================#
#       28. Teacher Notes:      #
#===============================#
# Arrays and Iterators - Text with directions, references and code
# Array, created by including elements within square brackets:
#
# a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#
# The index for an array starts with 0, so in the array above a[0] is 1
#
# Some methods you can use on arrays:
#
# arrayname.empty?
#
# arrayname.include?(itemname)
#
# arrayname.reverse
#
# arrayname.reverse! # use ! at the end to change the original array
#
# arrayname.shuffle
#
# arrayname.push(30) # will append new element 30 to the end array
#
# arrayname << 25 # << known as shovel operator will also append new element to the end of the array
#
# arrayname.unshift("someelement") # will add element "some element" to the beginning of the array
#
# arrayname.pop # will remove the last element of the array and return 1
#
# arrayname.uniq # will remove all the duplicates and display (will not change the original array)
#
# arrayname.uniq! # will remove all the duplicates in the original array
#
# A range:
#
# (0..25).to_a
#
# will create an array with elements from value 0 to 25
#
# (0..99).to_a.shuffle!
#
# will create an array with elements from value 0 to 99 in random order
#
# To loop through an array named y using the .each method and print out the value of each element:
#
# y.each { |i| puts i }
#
# In plain terms: For each element i in array y print the value of i
#
# To execute iteration through an array called names using a block:
#
# names.each do |randomvariablename| # starts the do block
#
# puts "Hello #{randomvariablename}" # executes code for each element
#
# end # ends the do block
#
# To capitalize (or use another method) on each element of array called names:
#
# names.each { |randomvariablename| puts "Hello #{randomvariablename.capitalize}" }
#
# Using the select method to pickup all the odd numbers from an array y:
#
# y.select { |number| number.odd? } # selects the value and returns it only if the condition is met
#
# To join the elements of an array named p:
#
# p.join
#
# To join the elements of an array with space in between each element:
#
# p.join(" ")
#
# To join the elements of an array with dash in between each element:
#
# p.join("-")




#=========================================#
#       29. Hashes a.k.a. Dictionary      #
#=========================================#

# Similar to JS objects
# Contain a list of key value pairs seperated by commas inside {}
#   sample_hash = {'a' => 1, 'b' => 2, 'c' => 3}

# Defining an empty hash
# my_hash = {}

# Create a hash
# my_details = {'name' => 'Jonah', 'favcolor' => 'purple'}
# # # Access a specific property of a hash
# # p my_details['favcolor']
#
# # There are things called symbols they are similar to strings but not quite
# # symbols are immutable and cannot be changed
# sample_hash = {'a' => 1, 'b' => 2, 'c' => 3}
# another_hash = {a: 1, b: 2, c: 3}
#
# p sample_hash.keys # => ['a', 'b', 'c']
# p sample_hash.values # => [1, 2, 3]
#
# # iterate over a hash
# sample_hash.each do |key, value|
#   puts "The class for key is #{key.class} and the value is #{value.class}"
# end
# # => The class for key is String and the value is Integer
# # => vvv
# # => vvv
#
#
# # Add a key/value pair to a hash
# another_hash[:d] = 'Jonah'
# p another_hash # => {:a=>1, :b=>2, :c=>3, :d=>"Jonah"}
#
# # Change an existing keys value
# another_hash[:d] = 'Ruby'
# p another_hash # => {:a=>1, :b=>2, :c=>3, :d=>"Ruby"}
#
# # Another way to iterate over a hash
# another_hash.each{|key, value| puts "Key is #{key} and value is #{value}"}
# # => Key is a and value is 1
# # etc...
#
# # Conditional iteration
# p another_hash.select{|k, v| v.is_a?(String)} # => {:d=> "Ruby"}
# # Returns items that are strings
#
# # What if we want to delete items that are strings?
# another_hash.each{|k, v| another_hash.delete(k) if v.is_a?(String)}
# p another_hash



#===============================#
#       30. Teacher Notes:      #
#===============================#

# Hashes - Text with directions, references and code
# To create a hash called my_details include the elements within { }:
#
# my_details = {'name' => 'mashrur', 'favcolor' => 'red'}
#
# To access the value and notify me what favcolor is:
#
# my_details["favcolor"]
#
# Alternate syntax to create key, value pairs in hash:
#
# myhash = {a: 1, b: 2, c: 3, d: 4}
#
# But this will create symbols a, b, c and d (not strings) as keys
#
# To access the value for key c above:
#
# myhash[:c]
#
# To add a key, value pair to the hash above:
#
# myhash[:d] = 7
#
# myhash[:name] = "Mashrur"
#
# To delete a key, value pair simply delete the key:
#
# myhash.delete(:d)
#
# To list the keys in a hash, followed by values of the hash:
#
# myhash.keys
# myhash.values
# To iterate through a hash using .each method and print out value:
#
# myhash.each { |somekey, somevalue| puts somevalue }
#
# To iterate through a hash using .each method and print out both key and value in friendly format:
#
# myhash.each { |somekey, somevalue| puts "The key is #{somekey} and the value is #{somevalue}" }
#
# To iterate through and delete a items from a hash based on a condition (in the condition below if the value is greater than 3:
#
# myhash.each { |k, v| myhash.delete(k) if v > 3 }
#
# Use select method to display items only if value of the item is odd
#
# myhash.select { |k, v| v.odd? }


#================================================#
#       31. Homework Project: Authenticator      #
#================================================#

#     My Solution     #
# Hold user data objects
# users = [
#   {username: "test1", password: "test1"},
#   {username: "test2", password: "test2"},
#   {username: "test3", password: "test3"},
#   {username: "test4", password: "test4"},
#   {username: "test5", password: "test5"}
# ]

# # Welcome screen
# puts "Welcome to the Authenticator"
# 28.times{print "*"}
# puts
# puts "This program will take input from the user and compare password"

# # set initial counter to limit to 3 tries
# i = 0
# # boolean for if a correct username/password has been entered
# correct = false

# #start a loop to receive input and check credentials
# while i <= 2
#   # Request and receive username
#   print "Username: "
#   user = gets.chomp

#   # Request and receive password
#   print "Password: "
#   pass = gets.chomp

#   # Loop through users array
#   for item in users
#     # Look for if a hash's username AND password match what user entered
#     if item[:username] == user && item[:password] == pass
#       # If it matches set the correct boolean to true
#       correct = true
#       # show the user object on screen
#       puts item
#       # Increment the counter to stop the loop
#       i = 3
#     end
#   end

#   # If user/password combo was not found in array
#   if !correct && i < 2
#     # Tell the user it was wrong and how many tries remain
#     puts "Credentials not correct. #{2 - i} tries remaining."
#     # Give instruction to continue or exit
#     puts "Press \"n\" to exit or any key to continue"
#     # Receive user request to continue or exit
#     key = gets.chomp
#     if key == "n"
#       # if user chose to exit set counter to stop loop otherwise continue as normal
#       i = 3
#     end
#   end
#   # increase counter before restarting loop
#   i += 1
# end




#     Teacher Solution      #

# Store user data
# users = [
# {username: "test1", password: "test1"},
# {username: "test2", password: "test2"},
# {username: "test3", password: "test3"},
# {username: "test4", password: "test4"},
# {username: "test5", password: "test5"}
# ]

# # function to check user data vs entered data
# def auth_user(username, password, users_list)
#   # Loop through list of user data
#   users_list.each do |user|
#     # if the username and password match the item in user data
#     if user[:username] == username && user[:password] == password
#       # return the user object
#       return user
#     end
#   end

#   # Let the do loop through every item in array
#   # If it didn't break from finding a match return that Credentials were not correct
#   return "Credentials were not correct"
# end

# # Welcome section
# puts "Welcome to the authenticator"
# 25.times {print "-"} # Seperator
# puts # Line break
# # instructions
# puts "This program will take input from the user and compare password"
# puts "If password is correct, you will get back the user object"


# # Initialize counter for attempts
# attempts = 1
# # Only run this loop while there are attempts remaining
# while attempts < 4
#   print "Username: " # request username
#   username = gets.chomp # receive username
#   print "Password: " # request password
#   password = gets.chomp # receive password

#   # Run username and password through authenticator function and save result
#   result = auth_user(username, password, users)
#   # print result of running authenticator function
#   puts result
#   # => {USER OBJECT}
#   # or 
#   # => "Credentials were not correct"

#   #  Prompt to continue or quit
#   puts "Press n to quit or any other key to continue"
#   input = gets.chomp.downcase # receive input (transforms to lowercase)
#   # if input is "n" break out of while loop
#   break if input == "n"

#   # increase attempts count before exiting loop
#   attempts += 1
# end

# # If attempts counted too high, tell user
# puts "You have exceeded the number of attempts" if attempts >= 4




#===================================#
#        34. Ruby Style Guide       #
#===================================#

# Snake case
# method names + variable assignments
# this_is_snake_case

# tabs are 2 spaces

# Pascal case
# class definitions
# ThisIsPascalCase

# Camel case
# NOT USED IN RUBY
# thisIsCamelCase

#===============================================#
#       36. Homework: Area Code Dictionary      #
#===============================================#

# There is a hash that contains city names => area codes
# When project is run it should prompt asking for a city name and return it's area code

# Hash containing city names and area codes

# Method get_city_names(hash)
# lists area

# ON RUN (Use loop do)
# Promp user asking if they want to find area code based on city name? (y/n) (capital or lowercase should both work) (exit program if not y)
#   if y
#     Ask what city do you want the area code for?
#     (list of cities)
#     Enter your selection (get input)
#     return area code
#     loops back to step 1

# Hash
# contains city name and area codes as key pairs
# dial_book = {
#   "newyork" => "212",
#   "newbrunswick" => "732",
#   "edison" => "908",
#   "plainsboro" => "609",
#   "sanfrancisco" => "301",
#   "miami" => "305",
#   "paloalto" => "650",
#   "evanston" => "847",
#   "orlando" => "407",
#   "lancaster" => "717"
# }

# # Receives a hash and returns a list of cities
# def get_city_name(hash)
#   25.times{print "-"} # seperator
#   puts
#   # Loop through dial book
#   hash.each do |item|
#     puts item[0]# Read and print the city name
#   end
#   25.times{print "-"} #seperator
#   puts
# end

# # Receives a hash and key and returns it's pair
# def get_area_code(hash, key)
#   hash.each do |item|
#     if item[0] == key # if key match was found
#       return item[1] #return its value
#     end
#   end
#   # no matches were found
#   return -1
# end

# # execution flow
# # start infinite loop
# loop do
#   # Prompt user for exit/continue
#   puts "Do you want to lookup an area code based on a city name? (Y/N)" 
#   answer = gets.chomp.downcase #receive user answer
#   break if answer != "y" # quit if user didn't request to continue

#   # If user answers "y"
#   # ask the user what city they want an area code for
#   puts "What city do you want the area code for?"
#   get_city_name(dial_book) #print all city names to user
#   city = gets.chomp # retrieve city name from user

#   result = get_area_code(dial_book, city)
  
#   if result != -1 #result was valid
#     puts "Area code for #{city} is: #{result}"
#   else # result was invalid
#     puts "City name invalid"
#   end
# end

#     Teacher Solution      #
# dial_book = {
#   "newyork" => "212",
#   "newbrunswick" => "732",
#   "edison" => "908",
#   "plainsboro" => "609",
#   "sanfrancisco" => "301",
#   "miami" => "305",
#   "paloalto" => "650",
#   "evanston" => "847",
#   "orlando" => "407",
#   "lancaster" => "717"
# }

# def get_city_names(somehash)
#   somehash.keys
# end

# def get_area_code(somehash, key)
#   somehash[key]
# end

# loop do
#   puts "Do you want to lookup an area code based on a city name?(Y/N)"
#   answer = gets.chomp.downcase
#   break if answer != "y"
#   puts "Which city do you want the area code for?"
#   puts get_city_names(dial_book)
#   puts "Enter your selection"
#   prompt = gets.chomp
#   if dial_book.include?(prompt)
#     puts "The area code for #{prompt} is #{get_area_code(dial_book, prompt)}"
#   else
#     puts "You entered a city name not in the dictionary"
#   end
# end




#==============================================#
#       40. Practice what you have learnt      #
#==============================================#



# https://try.ruby-lang.org/



# Summary 1
  # The editor
    # Typing code into the editor and clicking on run gives you an answer in the ouput window. (Almost) all code gives an answer.

  # Numbers and strings
    # Numbers and strings are Ruby’s math and text objects.

  # Methods
    # You’ve used English-language methods like reverse and length. And symbolic methods like the multiplication method: *
    # Methods mean action!
  # This is the essence of your learning. Taking simple things, toying with them and turning them into new things. Feeling comfortable yet? I promise you are.



# Summary 2
  # Errors
    # If you try to reverse a number or do anything fishy, Ruby will tell you so.

  # Arrays
    # Arrays are lists for storing things in some order. We also know how to create array’s and get items from array’s.

  # Variables
    # Variables save a thing and give it a name. You used the equals sign to do this. Like: ticket = [14, 37, 18].



# Summary 3
  # Exclamations
    # Methods may have exclamations (and also question marks) in their name. These are just there to better explain what their function is. No big deal.

  # String manipulation
    # Search and change strings

  # Chaining
    # Chaining methods lets you get a lot more done. Break up a poem, reverse it, reassemble it: poem.lines.reverse.join

  # At this point, you may want to tinker with the poem a bit more. A complete list of all the String methods is here.

  # Go ahead and try a few, such as: poem.downcase or poem.swapcase



# Summary 4
  # Hashes
    # The little dictionary with the curly pages: {}

  # Symbols
    # Tiny, efficient code words with a colon, like: :splendid

  # Blocks
    # Chunks of code which can be tacked on to many of Ruby’s methods. Here’s the code you used to build a scorecard:
    # books.values.each { |rate| ratings[rate] += 1 }



# Summary 5
  # Methods
    # Methods can be defined with def and have a name. Methods make your program shorter and easier to read.

  # Parameters
    # Methods can have parameters.

  # Return values
    # Methods (almost) always return a value.



# Summary 6
  # Data
    # You loaded some data off the internet, traversed a data structure and selected values.

  # Iterating
    # You iterated all elements of a hash and you chained some more methods.

  # Pretty printing
    # And if that wasn’t enough, you formatted and printed some values in a way that is easy to read for humans. In fact you made a real program!

  # IF
    # You learned to take control of your programs with if and else statements.



# Summary 7
  # Classes
    # Everything in Ruby is some kind of object. Classes explain objects, how a certain object works. For example, you made a few BlurbTM objects and these objects are explained in the Blurb class. In other words: you call them Blurb objects. You can use classes to (kinda) model real life objects.

  # Accessors
    # Accessors are variables attached to an object which can be used outside the object. (blurb2.time = Time.now)

  # Object variables
    # Object variables are the same variables you’re using for accessors, but inside the object. (@time = Time.now)



#============================================================#
#       41. Introduction to Object Oriented Programming      #
#============================================================#

# Object Oriented programming
  
  # Definition
    # Object-Oriented programming (OOP) is a programming paradigm that uses objects and their interactions to design and program applications.
  
  # University
    # Student
      # sutdents - first name, last name, email, student id
      # courses - course name, course description, course id

  # Bookstore
    # book - ISBN, name, description
    # employee - SSN, firstname, last name, email, employee id


# * See oop_projects/student.rb



#===============================#
#       42. Teacher Notes:      #
#===============================#

# Introduction to Object Oriented Programming - Text directions, refs and code
# Object-oriented programming (OOP) is a programming paradigm that uses objects and their interactions to design and program applications

# - Allows the program to block off areas of code that perform certain tasks independently of other areas in the application.

# Encapsulation - concept of blocking off areas of code and not making it available to the rest of the program

# Abstraction - is simplifying a complex process of a program, an enterprise software solution for example by modeling classes appropriate for it

# Inheritance - is used where a class inherits the behavior of another class, referred to as the superclass

# Polymorphism - is when a class inherits the behaviors of another class, but has the ability to not inherit everything and change some of it’s inherited behaviors. For example to write a method that does something differently from the inherited method

# Classes - It is a blueprint that describes the state and behavior that the objects of the class all share. A class can be used to create many objects. Objects created at runtime from a class are called instances of that particular class.

# Example of a user class

# class User
#   attr_accessor :name, :email
#   def initialize(name, email)
#     @name = name
#     @email = email
#   end
#   def run
#     puts "Hey I'm running"
#   end
#   def self.identify_yourself
#     puts "Hey I am a class method"
#   end
# end
# user = User.new("mashrur", "mashrur@example.com")
# user.run
# User.identify_youself # to run this class method you don't need an instance of user 
#                       # you can directly call the class User 



#=================================================#
#       43. Attributes, Getters, and Setters      #
#=================================================#
# *See oop_projects/student.rb



#===============================#
#       44. Teacher Notes:      #
#===============================#

# Attributes, getters, setters - Text directions, references and code
# class Student
#   attr_accessor :first_name, :last_name, :email, :username, :password

#   def initialize(firstname, lastname, username, email, password)
#     @first_name = firstname
#     @last_name = lastname
#     @username = username
#     @email = email
#     @password = password
#   end

#   def to_s
#     "First name: #{@first_name}, Last name: #{@last_name}, Username: #{@username},
#                   email address: #{@email}"
#   end

# end

# mashrur = Student.new("Mashrur", "Hossain", "mashrur1", "mashrur@example.com",
#                       "password1")
# john = Student.new("John", "Doe", "john1", "john1@example.com",
#                       "password2")
# puts mashrur
# puts john
# mashrur.last_name = john.last_name
# puts "Mashrur is altered"
# puts mashrur



#========================================================================#
#       45. Final Ruby project: Classes, Modules, Mixins - 1-bcrypt      #
#========================================================================#

# Use case for students class - Authentication systems in web applications
# Think of students as users
# Done with usernames and passwords
# Security for user information is very important
# Passwords are virtually never stored in their string forms
# Hashed digests are used in the databases
# A popular hasing algorithm is MD5 - bcrypt
# Creates a hash digest of the string
# https://www.rubydoc.info/github/codahale/bcrypt-ruby/BCrypt/Password

# require 'bcrypt'

# # hash a user's password
# my_password = BCrypt::Password.create("my password") #=> "$2a$12$C5.FIvVDS9W4AYZ/Ib37YuWd/7ozp1UaMhU28UKrfSxp2oDchbi3K

# puts my_password                      # => "s0m3l0ng%h@5hw1thnum6ers23948y$./"
# # .version of algorithm used to create hash
# puts my_password.version              # => "2a"
# # The cost factor used to create the hash
# puts my_password.cost                 # => 12
# puts my_password == "my password"     # => true
# puts my_password == "not my password" # => false


# my_password = BCrypt::Password.new("$2a$12$xW9B6SfSeAAkkGXui.CCtufj1SXhExSBMPYIY8D9W3w.pA51.in9i")
# my_password = "my password"       # => true
# my_password = "not my password"   # => false




#===============================#
#       46. Teacher Notes:      #
#===============================#
# You can find information on bcrypt and the hashing algorithm it uses here https://www.rubydoc.info/github/codahale/bcrypt-ruby

# You can also find the code used in the video there (posted below) along with installation instructions for bcrypt gem:

# require 'bcrypt'
 
# my_password = BCrypt::Password.create("my password")
#   #=> "$2a$10$vI8aWBnW3fID.ZQ4/zo1G.q1lRps.9cGLcZEiGDMVr5yUP1KUOYTa"
 
# my_password.version              #=> "2a"
# my_password.cost                 #=> 10
# my_password == "my password"     #=> true
# my_password == "not my password" #=> false
 
# # my_password = BCrypt::Password.new("$2a$10$vI8aWBnW3fID.ZQ4/zo1G.q1lRps.9cGLcZEiGDMVr5yUP1KUOYTa")
# # my_password == "my password"     #=> true
# # my_password == "not my password" #=> false






#=========================================================================#
#       47. Final Ruby Project: Classes, Modules, Mixins - 2 Methods      #
#=========================================================================#

# *See hash_pass.rb

# require 'bcrypt'

# # my_password = BCrypt::Password.create("my password")
# # puts my_password

# my_password = BCrypt::Password.new("$2a$12$LkExTLlPpme5lycpUyUaOO/2HBMZrzztfQBEUBwAi156A9ijG61gi")
# puts my_password == "my password"     #=> true
# puts my_password == "not my password" #=> false




#==============================#
#       48. Teacher Notes      #
#==============================#

# We created a crud.rb file and filled it in:

# require 'bundler/inline'
 
# gemfile true do
#  source 'http://rubygems.org'
#  gem 'bcrypt'
# end
 
# require 'bcrypt'
 
# users = [
#           { username: "mashrur", password: "password1" },
#           { username: "jack", password: "password2" },
#           { username: "arya", password: "password3" },
#           { username: "jonshow", password: "password4" },
#           { username: "heisenberg", password: "password5" }
#         ]
 
# def create_hash_digest(password)
#   BCrypt::Password.create(password)
# end
 
# def verify_hash_digest(password)
#   BCrypt::Password.new(password)
# end
 
# def create_secure_users(list_of_users)
#   list_of_users.each do |user_record|
#     user_record[:password] = create_hash_digest(user_record[:password])
#   end
#   list_of_users
# end


#=========================================================================#
#       49. Final Ruby Project: Classes, Modules, Mixins - 3-Modules      #
#=========================================================================#
# # *See also hash_pass.rb

# # One way to load a module
# require_relative 'hash_pass'

# # Another way to load a module 
# # $LOAD_PATH << "."
# # require 'hash_pass'

# users = [
#   { username: "mashrur", password: "password1" },
#   { username: "jack", password: "password2" },
#   { username: "arya", password: "password3" },
#   { username: "jonsnow", password: "password4" },
#   { username: "heisenberg", password: "password5" }
# ]

# hashed_users = HashPass.create_secure_users(users)

# puts hashed_users




#==============================#
#       50. Teacher Notes      #
#==============================#

# Final Ruby project 3 - Text follow-up
# Update the crud.rb file to turn it into a module, completed file below:

# require 'bundler/inline'
 
# gemfile true do
#  source 'http://rubygems.org'
#  gem 'bcrypt'
# end
 
# module Crud
#   require 'bcrypt'
#   puts "Module CRUD activated"
 
#   def Crud.create_hash_digest(password)
#     BCrypt::Password.create(password)
#   end
 
#   def Crud.verify_hash_digest(password)
#     BCrypt::Password.new(password)
#   end
 
#   def Crud.create_secure_users(list_of_users)
#     list_of_users.each do |user_record|
#       user_record[:password] = create_hash_digest(user_record[:password])
#     end
#     list_of_users
#   end
 
#   def Crud.authenticate_user(username, password, list_of_users)
#     list_of_users.each do |user_record|
#       if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
#         return user_record
#       end
#     end
#     "Credentials were not correct"
#   end
# end
# In front of all the method names we used a class reference, you can replace this or use self. in their place, that is how you reference class methods. The code in the main.rb file would still work if you use self.create_secure_users for example. This is a good opportunity for you to read up on the difference between "class methods" and "instance methods". We will see how to convert these into instance methods in the next video by using the module as a mixin for our student object.

# We then updated the main.rb file (or wherever you want to use the module from):

# require_relative 'crud'
 
# users = [
#           { username: "mashrur", password: "password1" },
#           { username: "jack", password: "password2" },
#           { username: "arya", password: "password3" },
#           { username: "jonshow", password: "password4" },
#           { username: "heisenberg", password: "password5" }
#         ]
 
# hashed_users = Crud.create_secure_users(users)
# puts hashed_users




#=================================================#
#       51. 'self' Notation for Method Names      #
#=================================================#

# .self can be used in a module to make a function publicly accessible instead of using the modules name





#=========================================================================#
#       52. Final Ruby Project: Classes, Modules, Mixins - 4-include      #
#=========================================================================#

# *See hash_pass.rb and student.rb for 'includes' info

# require_relative 'hash_pass'
 
# users = [
#           { username: "mashrur", password: "password1" },
#           { username: "jack", password: "password2" },
#           { username: "arya", password: "password3" },
#           { username: "jonshow", password: "password4" },
#           { username: "heisenberg", password: "password5" }
#         ]
 
# hashed_users = HashPass.create_secure_users(users)
# puts hashed_users

#==============================#
#       53. Teacher Notes      #
#==============================#

# Final Ruby project 4 - Text follow-up
# We ended up with a final crud.rb file with our Crud module which looked like below (if not using repl, you can leave out the require bundler and bcrypt gem installation parts on top):

# require 'bundler/inline'
 
# gemfile true do
#  source 'http://rubygems.org'
#  gem 'bcrypt'
# end
 
# module Crud
#   require 'bcrypt'
#   puts "Module CRUD activated"
 
#   def create_hash_digest(password)
#     BCrypt::Password.create(password)
#   end
 
#   def verify_hash_digest(password)
#     BCrypt::Password.new(password)
#   end
 
#   def create_secure_users(list_of_users)
#     list_of_users.each do |user_record|
#       user_record[:password] = create_hash_digest(user_record[:password])
#     end
#     list_of_users
#   end
 
#   def authenticate_user(username, password, list_of_users)
#     list_of_users.each do |user_record|
#       if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
#         return user_record
#       end
#     end
#     "Credentials were not correct"
#   end
# end
# Below was my student.rb class:

# require_relative 'crud'
 
# class Student
#   include Crud
#   attr_accessor :first_name, :last_name, :email, :username, :password
 
#   def initialize(firstname, lastname, username, email, password)
#     @first_name = firstname
#     @last_name = lastname
#     @username = username
#     @email = email
#     @password = password
#   end
 
#   def to_s
#     "First name: #{@first_name}, Last name: #{@last_name}, Username: #{@username},
#                   email address: #{@email}"
#   end
 
# end
 
# mashrur = Student.new("Mashrur", "Hossain", "mashrur1", "mashrur@example.com",
#                       "password1")
# john = Student.new("John", "Doe", "john1", "john1@example.com",
#                       "password2")
 
# hashed_password = mashrur.create_hash_digest(mashrur.password)
 
# puts hashed_password
# Congratulations on having completed section 2 and learning about the Ruby programming language! We will start with Ruby on Rails and web application development in the next section, see you there.




#==================================#
#       54. Quiz 2: Ruby Quiz      #
#==================================#

# What is the solution to 5 + 4 entered in IRB console?
  # 5 + 4
  # 54 
  # 9     => true

# What happens when you type in "josephine".methods in the IRB console?
  # IRB displays the string methods available for the string "Josephine" => true
  # IRB displays "My name is Josephine"
  # IRB notifies user that josephine is a string

# What is the comparison operator to use when comparing to see if two objects are equal to one another?
  # =
  # | |
  # ==      => true

# How do you specify what you are creating is an array?
  # By declaring array1 = "This is an array"
  # By declaring array1 = ["Item 1", "Item 2"]    => true
  # By declaring array1 = {}

# What is the preferred way of iterating through a list of objects in ruby?
  # for loop
  # while loop
  # .each method      => true

  