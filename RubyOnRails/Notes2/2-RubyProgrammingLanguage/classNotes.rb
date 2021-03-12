#=======================================#
#           HELP and Resources          #
#=======================================#

# Instructor Website: https://www.mashrurhossain.com/
# Discord: https://discord.com/invite/0fcPkObEsGTjNSvQ

# Ruby: www.ruby-lang.org/en

# IDE and Development tools
#   Ruby in browser: repl.it
#   AWS Cloud9: https://aws.amazon.com/cloud9/

# Sharing code:
#   gist: gist.github.com









#===============================================#
#           13. Intro to S2 and Ruby            #
#===============================================#

# # How to say "Hello World" in multiple ways
#     # Simple put string:
#         puts "Hello World" # => Hello World
#         # puts is a short for put string
#         # doesn't return value, just prints text to terminal

#         # puts: prints what is given
#         # p: doesn't return nill, returns arguement given
#         # print: same as puts but does not add a new line after
#         #           /n at end of string will create a new line
#         #           ex: print "Hello World/n"
        
#     # Using a variable:
#         greeting = "Hello World"
#         puts greeting # => Hello World
#         # String is stored in greeting variable
#         # Allows us to make changes to the value in the variable more easily

#     # Using a method:
#         def say_hello(thing_to_say)
#             puts thing_to_say
#         end

#         say_hello(greeting) # => Hello World

#         # First create a method
#         # Method is named say_hello and it receives a parameter 
#         # Parameter is output to terminal in second line of method
#         # Nothing happens until it is called with:
#             # say_hello(parameter)
#         # Since greeting was assinged a value that value is passed and printed

# # To run a ruby file you have created: $ruby path/to/file.rb
# # This will output any print statements and returned values to the terminal





#==================================#
#   14. Instructor Notes: Intro    #
#==================================#

# Ruby resource:

# www.ruby-lang.org

# To view current directory:

# pwd

# To create a directory:

# mkdir directory_name

# To move into a directory:

# cd directory_name

# **This command above will only work if the directory_name is listed as one of the folders within the current directory

# To list all directories and files within current directory:

# ls

# To list all directories and files within current directory including hidden files:

# ls -a

# To move out of a directory (1 level up the tree):

# cd ..

# To print hello world to the console or output:

# puts "Hello World!"

# In repl you can simply click the play button. But in cloud9, AWS cloud9 or your local environment, first ensure you are in the directory which includes the file where you have written the hello world program and then run it using the command below (this is assuming the filename is playground.rb)

# From the command line:

# ruby playground.rb

# To create a variable called hello and print the value of hello:

# hello = "Hello World!"
# puts hello
# The following is the structure of a method in Ruby, things to remember are the keywords def and end:

# def methodname
#   # contents of method
# end
# To write a method to say hello world you can write:

# def say_hello
#   puts "Hello World!"
# end
# Then call the method by simply referencing the name:

# say_hello

# Updated hello method:

# def say_hello(thing_to_say)
#   puts thing_to_say
# end
# To make this method say things:

# say_hello "My name is Mashrur"

# say_hello "Welcome to the Complete Ruby on Rails Developer Course"

# say_hello "Check it out this prints anything I want"










#===============================================#
#           15. Working with Strings p1         #
#===============================================#

# sentence = "My name is Jonah" # Single ('') or double ("") quotes are accepted
# p sentence

# # String concatenation
#     # concatenation is combing multiple strings into a single string
#     first_name = "Jonah"
#     last_name = "Thompson"
#     puts first_name + " " + last_name
#     # This works but can be a little messy, which is where string interpolation comes in handy

# # String interpolation
#     # Note: You can not do string interpolation w/ single quotes
#     puts "My first name is #{first_name} and my last name is #{last_name}"
#     full_name = "#{first_name} #{last_name}"
#         # => My first name is Jonah and my last name is Thompson
#     # use #{} and fill the curly braces with the variable that is needed


# # Methods, how to find them
#     # To find methods specify a value or variable and use .methods function
#     p first_name.methods # => Long list of all methods available to be performed on the variable
#     p 10.methods # => Same as above

# # Common methods
#      # You can invoke methods directly on a value
#     # This is because in Ruby everything is an object, even primative values

#     # Find type or class of a variable's value w/ .class
#     p "Jonah".class # =>String
#     p full_name.class # =>String
#     p 10.class # => Integer
#     p 10.0.class # => Float

#     # Change class type:
#     p 10 # => 10
#     p 10.to_s # => "10"
#     p 10.to_s.class # =>String
#     # This is method chaining
#     # The output of one method is passed into the next method

#     # Get length:
#     p full_name.length # =>14
#     p full_name.reverse # =>"nospmohT hanoJ"
#     p full_name.capitalize # =>"Jonah thompson"
#     p full_name.empty? # =>false
#     p "".empty? # =>true
#     p "".nil? # =>false
#     p nil.nil? # =>true
     
#     # Manipulate part of a string
#     sentence = "Welcome to the jungle, the jungle"
#     p sentence.sub("the jungle", "utopia") # => "Welcome to utopia, the jungle"
#     p sentence.gsub("the jungle", "my swamp") # => "Welcome to my swamp, my swamp"
#     # Difference between .sub and .gsub:
#         # .sub only replaces the first instance of the given sequence
#         # .gsub (global sub) will replace all instances of given sequence
    

# # Variable assignment
#     new_first_name = first_name 
#     p new_first_name # => "Jonah"
#     # the value is "Jonah" because the value of first_name is "Jonah"
#     # When setting a var equal to a var (x = y) x is given the value that y held

#     p first_name = "John"
#     p new_first_name # => "Jonah"
#     # Here you can see that new_first_name didn't change it's value when first_name did
#     # This is because it was set equal to the value of first_name, not to first_name itself
    

# # Escaping
#     p sentence = "New first name is \#{new_first_name}" # =>"New first name is \#{new_first_name}"
#     # The value of new_first_name is not interpolated because of the escape char (\)
#     # any special characters immediately following will be treated as string instead of code

#     # p sentence = 'He asked, 'Hey how are you doing'' # => ERROR because quotes end string mid-string
#     p sentence = 'He asked, \'Hey how are you doing?\'' # => "He asked 'Hey how are you doing?'"


# # Variables can also be created, printed, and manipulated directly in the terminal
# # Use irb (interactive ruby) in terminal
# # ex:
#     # $irb
#     # $first_name = "Jonah"
#     # $last_name = "Thompson"
#     # $full_name = "#{first_name} #{last_name}"
#     # $full_name
#     # => Jonah Thompson
#     # $exit










#===========================================================#
#           16. Working w/ Strings p2 Getting input         #
#===========================================================#
# # How to get input from user?
# puts "What is your first name?"
# first_name = gets.chomp
#     # gets.chomp allows the user to input their first name and saves it to a var
# # puts "Thank you #{first_name}" # => "Thank you Jonah" (or whatever was typed)

# puts "Enter a number to multiply by 2" 
# input = gets.chomp # $5
# puts input * 2 # =>"55"
# # This will return "55" because gets.chomp retrieves a string from the user
# # It must first be changed to a number from string before multiplied

# puts "Enter a number to multiply by 2"
# input = gets.chomp # $5
# puts input.to_i * 2 # =>10
# # Now input is converted to int before it is multiplied and 


##################
#   HOMEWORK     #
##################
# # Receive first_name and last_name
# # Puts full name
# # Puts full name reversed
# # Puts full name length (not including space)

# # Receive first name
# puts "Enter your first name: "
# first_name = gets.chomp
# # Receive last name
# puts "Enter your last name: "
# last_name = gets.chomp
# full_name = "#{first_name} #{last_name}"

# #puts full name
# puts "Your full name is #{full_name}"
# # puts full name reversed
# puts "Your full name reversed is #{full_name.reverse!}"
# # puts full name length (not including space)
# puts "Your full name has #{first_name.length + last_name.length} characters"





#===============================================================#
#            17. Instructor Notes: Working w/ Strings           #
#===============================================================#

# To start irb console:

# irb

# To exit the console:

# exit

# String concat structure:

# String1 + String2

# String1 + " " + String2 + String3

# To find out what class the object belongs to:

# Variable_name.class

# 1.class # This will return integer, signifying that 1 is of type integer

# To find out methods available to an object:

# objectname.methods

# Some methods that can be used on objects:

# objectname.nil?

# objectname.empty?

# objectname.length

# objectname.reverse

# String interpolation (remember has to be within double quotes):

# name = "Mashrur"

# "My name is #{name}"

# **This will print out the value of name in the line "My name is...."

# To escape the evaluation of #{variablename} within a String, prepend with a \:

# \#{variablename}

# To get input from the command line use the following method:

# gets.chomp

# To assign the input to a variable so it can be referenced later on:

# variablename = gets.chomp





#=========================================================#
#            18. Homework Solution: analyzer.rb           #
#=========================================================#

# puts "Enter your first name"
# first_name = gets.chomp
# puts "Enter your last name"
# last_name = gets.chomp
# full_name = first_name + " " + last_name
# puts "Your full name is #{full_name}"
# puts "Your full name reversed is #{full_name.reverse}"
# puts "Your name has #{full_name.length - 1} characters in it"










#=============================================#
#            19. Working w/ Numbers           #
#=============================================#

# # Basic arithmetic works as expected
# puts 1 + 3 # => 4
# puts 6 - 4 # => 2
# puts 4 * 0 # => 0
# puts 18 / 3 # => 6
# puts 37 / 4 # => 9
# # The last example should have a remainder but doesn't
# # By default ruby uses int which drops decimals or remainders (whole number only)
# # In order to get around this you have to use floats instead of ints
#     # Note: only 1 number has to be a float for the result to be a float
# puts 37.0 / 4 # => 9.25
# puts 37 / 4.to_f # => 9.25

# puts (37 / 4).to_f # => 9.0
# # The above doesn't work because the ints 37/4 is evaluated to get 9
# #   After that 2 is converted to a float to get 9.0

# x = 5
# y = 10
# puts y / x # =>2

# # puts "5" * "5" # =>Error because both are strings
# puts "5" * 5 # =>"55555"
# # This works because the string "5" is printed 5 times but doesn't calculate mathematically

# # puts 5 * "5" # =>Error because you cannot multiply a number by a string
# x = "5".to_i # =>5
# x = "10".to_f # => 10.0
# x = "Hello".to_i # => 0
# # Will return 0 if a number cannot be converted to an int


# 20.times {puts "hi"}
# # .times method will repeat the action in brackets however many times for the int it is called on

# 20.times{puts rand(10)}
# # generates 20 random numbers between 0 and 9
# #   for numbers between 1 and 10 use: puts rand(10) + 1
# # rand by itself generates 1 number between 0 and 1
# # adding an arguement multiplies the result by that arguement to set a non-inclusive max

# puts "Simple Calculator"
# 25.times {print "-"}
# print "\nEnter the first number: " # \n for newline after "-----" 
# num_1 = gets.chomp
# print "Enter the second number: "
# num_2 = gets.chomp
# puts "The first number multiplied by the second number is #{num_1.to_f * num_2.to_f}"
# # num_1 and num_2 must be converted to float before they are calculated since they are saved as strings
# # They could be converted when received but it is good practice to save raw data as input by user
# #   In this case we can convert as we are calculating



#################
#   HOMEWORK    #
#################
# Do Simple Calculator above but add addition, subtraction, division, and modulus (remainder)

# puts "Simple Calculator"
# 25.times {print "-"}
# print "\nEnter the first number: "
# num_1 = gets.chomp
# print "Enter the second number: "
# num_2 = gets.chomp
# puts "The first number multiplied by the second number is: #{num_1.to_f * num_2.to_f}"
# puts "The first number divided by the second number is: #{num_1.to_f / num_2.to_f}"
# puts "The first number added with the second number is: #{num_1.to_f + num_2.to_f}"
# puts "The first number minus the second number is: #{num_1.to_f - num_2.to_f}"
# puts "The remainder of the first number divided by the second number is: #{num_1.to_f % num_2.to_f}"





#================================================================#
#            20. Instructor Notes: Working w/ Numbers            #
#================================================================#

# To add and display the value of 1 + 2:

# puts 1 + 2

# Different operations:

# 1 + 2

# 1 * 2

# 1 / 2

# 1 - 2

# 1 % 2

# To indicate a number is a float instead of an integer include a . in the number:

# 20 is an integer, 20.0 is a float

# or

# 20.to_f

# Methods you can use:

# object.odd?

# 22.odd?

# object.even?

# 22.even?

# Comparisons:

# a == b

# 1 == 2

# 3 == 3

# 5 < 2

# 2 <= 5

# 5 > 2

# 5 && 6

# 5 || 6

# Generate a random number between 0 and less than 10:

# rand(10)

# To convert an string object to integer:

# objectname.to_i

# "5".to_i

# To convert an object to string:

# objectname.to_s

# 5.to_s





#===========================================================================#
#            21. Homework Solution: Analyzer (Simple Calculator)            #
#===========================================================================#

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










#==============================================================#
#            22. Brief Look at Comparison Operators            #
#==============================================================#

# Comparison operators are used to compare to values and returns whether the comparison is true or false

# x == y
#   Compares the value of 2 variables. If they have the same value then true
#   Note this is different from the assignment operator (=) 
#       x = y sets value of x to equal the value of y
#       x == y compares the values of x and y

# x != y
#   compares whether 2 values are NOT equal. If they have the same value then false

# x > y
#   Compares whether value 1 is greater than value y. If greater then true

# x < y
#   Compares whether value 1 is les than value 2. If greater then false.

# x >= y
#   Compares whether value is greater than OR equal to y. Returns true if either case is true.

# x <= y
#   Compares whether value is less than OR equal to y. Returns true if either case is true










#===================================#
#            23. Methods            #
#===================================#
# When you have a algorithm or set of instructions that can be repeated/re-used you can store it as a method

# def multiply(first_num, second_num)m
#     return first_num.to_f * second_num.to_f
#     # return is unnecessary here because it is the only expression 
#     #   (or if it is the last expression that should be returned)
# end

# def divide(first_num, second_num)
#     first_num.to_f / second_num.to_f
# end

# def subtract(first_num, second_num)
#     first_num.to_f - second_num.to_f
# end

# def add(first_num, second_num)
#     first_num.to_f + second_num.to_f
# end

# def modulus(first_num, second_num)
#     first_num.to_f % second_num.to_f
# end

# puts "Simple calculator"
# 20.times { print "-" }
# puts
# puts "Please enter your first number"
# first_number = gets.chomp
# puts "Please enter your second number"
# second_number = gets.chomp
# puts "The first number multiplied by the second number is: #{multiply(first_number, second_number)}"
# puts "The first number divided by the second number is: #{divide(first_number, second_number)}"
# puts "The first number subtracted from the second number is: #{subtract(first_number, second_number)}"
# puts "The first number added to the second number is: #{add(first_number, second_number)}"
# puts "The first number mod the second number is: #{modulus(first_number, second_number)}"










#========================================================#
#            24. Branching: if/elsif/else/end            #
#========================================================#

# # if/else
# #   Used to perform different actions based on different requirements being met
# #   For if/else there is a test and 2 actions
# #   If the test is true the first action is performed (action following if and the test)
# #       If the test is true it will also skip through the rest of the if/else statement
# #       This ignores everything that is not part of the if block
# #   If the test is false then the second action is performed (action following the else statement)
# #   There can be multiple conditions that are tested at once using logical/comparison operators
# #       &&   ||   >    <    =   <=    >=
# #           For and (&&) BOTH statements must pass the test
# #           For or (||) at least of the statements must pass the test
# #   Conditions (tests) can be chained using brackets
# #       ex: if (condition1 && condition2) || (condition3 && condition 4)

# # condition = true
# # another_condition = false
# # if condition || another_condition
# #     #execute some code
# #     puts "This passed the test"
# # else
# #     #execute some other code
# #     puts "This failed the test"
# # end

# # if/elsif
# #   With if/elsif you can chain multiple conditions and give each condition a specific action
# #   Similar to using "cases" (not discussed yet but was covered in js)
# #   BE CAREFUL: If a value meets multiple conditions only the first true one in the if/elsif chain will be run

# def multiply(first_num, second_num)
#     first_num.to_f * second_num.to_f
# end

# def divide(first_num, second_num)
#     first_num.to_f / second_num.to_f
# end

# def add(first_num, second_num)
#     first_num.to_f + second_num.to_f
# end

# def subtract(first_num, second_num)
#     first_num.to_f - second_num.to_f
# end

# puts "Simple Calculator"
# 20.times{print "-"}
# puts "\nEnter First Number:"
# first_num = gets.chomp
# puts "Enter Second Number:"
# second_num = gets.chomp
# puts "Select action by number: \n1 - multiply\n2 - divide\n3 - add\n4 - subtract"
# action = gets.chomp

# if action.to_i == 1
#     puts "You have chosen to multiply #{first_num} * #{second_num}"
#     puts "The result is: #{multiply(first_num, second_num)}"
# elsif action.to_i == 2
#     puts "You have chosen to divide #{first_num} / #{second_num}"
#     puts "The result is: #{divide(first_num, second_num)}"
# elsif action.to_i == 3
#     puts "You have chosen to add #{first_num} + #{second_num}"
#     puts "The result is: #{add(first_num, second_num)}"
# elsif action.to_i == 4
#     puts "You have chosen to subtract #{first_num} - #{second_num}"
#     puts "The result is: #{subtract(first_num, second_num)}"
# else
#     puts "Invalid action selected"
# end





#===================================================================#
#            25. Instructor Notes: Methods and Branching            #
#===================================================================#

# Structure of an if condition:

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

# def multiply(first_number, second_number)
#   first_number.to_f * second_number.to_f      
# end
 
# def divide(first_number, second_number)
#   first_number.to_f / second_number.to_f      
# end
 
# def subtract(first_number, second_number)
#   second_number.to_f - first_number.to_f      
# end
 
# def mod(first_number, second_number)
#   first_number.to_f % second_number.to_f      
# end
# Branching execution code sample:

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










#================================================#
#            26. Arrays and Iterators            #
#================================================#
# more info at: https://ruby-doc.org/core-2.5.0/Array.html

# Arrays are an ordered list of values, elements, items etc.
# They maintain an index (position number) of each item in the array
#   Indexes start at 0
#             [1, 2, 3, 4, 5, 6, 7, 8, 9]
#              ^  ^  ^  ^  ^  ^  ^  ^  ^
#       index: 0  1  2  3  4  5  6  7  8 
#   A negative index number counts backwards from the end of the array
#             [1, 2, 3, 4, 5, 6, 7, 8, 9]
#              ^  ^  ^  ^  ^  ^  ^  ^  ^
#      index: -9 -8 -7 -6 -5 -4 -3 -2 -1

# You can easily create an array with a range by using ..
#   Ranges can be made with both numbers (1..10) or letters ("a".."z")
#   This creates a range which is different from an array but can be used to create an array
#   range.to_a will convert a range to an array
#       ex: x = 1..10 => x.to_a => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#   You can also use .shuffle to randomize the position of each item in an array
#       ex: x = 1..5 => x.to_a.shuffle => [3, 2, 5, 1, 4]
#   
#   The bang (!) symbol after a function mutates the caller
#       So if array.shuffle! the shuffling will be assign the new array to the array variable 
#           instead of just returning the result

# Methods to interact with an array: (More at https://ruby-doc.org/core-2.5.0/Array.html or use .methods)
    # last
        # array.last returns the last item in an array
            # a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            # puts a.last # =>9

    # first
        # array.first returns the first item in an array
            # a = [1, 2, 3]
            # puts a.first # =>1

    # reverse
        # array.reverse reverses the order of the array
            # a = [1, 2, 3, 4, 5]
            # puts a.reverse! # => [5, 4, 3, 2, 1]

    # length
        # array.length will tell you how many items are in an array
            # a = [1, 2, 3, 4, 5]
            # puts a.length # =>5

    # append (to end)
        # array.append() will add the arguement to the end of the array
            # a = [1, 2, 3]
            # puts a.append(4) # =>[1, 2, 3, 4]

        # array.push() will add the arguement to the end of the array
            # a = [1, 2, 3]
            # puts a.push(4) # =>[1, 2, 3, 4]

        # For Arrays and Strings: The shovel operator (<<) works like +=
            # It will take the current value and append the value after << to the end
                # a = [1, 2, 3]
                # print a << 4 # =>[1, 2, 3, 4]

                # b = "This is an"
                # puts b << " appended string" # => "This is an appended string"

        # For numbers (ints) the shovel operator works very differrently
            # It performs a left binary bit shift on the number however far is specified after <<
                # a = 5 # 5 in binary is 0101
                # a << 5 # =>160 # 160 in binary is 1010 0000
                    # Notice how the 1's moved 5 spaces to the left and the binary result is the new number

        # The shovel operator (<<) is not an available method for floats

    # append (to beginning)
        # array.unshift() adds the arguement to the beginning of the array
            # a = [1, 2, 3]
            # puts a.unshift("Jonah") # =>["Jonah", 1, 2, 3]

    # remove item from end of the array
        # array.pop will remove the last item from the array and return it
        # This follows a pattern called lifo behavior (last in first out)
            # a = [1, 2, 3, 4]
            # b = a.pop
            # puts a # =>[1, 2, 3]
            # puts b # =>[4]

    # remove duplicates
        # array.uniq will remove duplicate entries in an array (keeping the first)
            # a = [1, 2, 3, 2, 4]
            # puts a.uniq # =>[1, 2, 3, 4]

    # Check if empty
        # array.empty? willr return a boolean on whether or not the array is empty
            # a = [1, 2, 3]
            # b= []
            # puts a.empty? # =>false
            # puts b.empty? # =>true
    
    # Check if a value exists
        # array.include?() will check if the given arguement exists in the array
            # a = [1, 2, 3]
            # puts a.include?(2) # =>true
            # puts a.include?(5) # =>false

    # Combine all the elements of an array
        # array.join will take all the elements of an array and join them into a string
            # a = [1, 2, 3]
            # puts a.join # =>"123"
        # Adding an arguement will allow you to put something between each joined item
            # a = [1, 2, 3]
            # puts a.join("-") # =>"1-2-3"
            # puts a.join(", ") # =>"1, 2, 3"
    
    # Combine a patterned string into an array
        # string.split will take a string and put it into an array
            # a = "1-2-3-4"
            # puts a.split # =>["1-2-3-4"]
        # To make it more useful we can add an arguement to tell it what symbol to split the string at
            # a = "1-2-3-4"
            # puts a.split("-") # =>["1", "2", "3", "4"]

    # Quickly write an array of strings
        # %w(write string here) will seperate each word of the string at the space char and create an array with each word
            # a = %w(Hello there general kenobi)
            # puts a # =>["Hello", "there", "general", "kenobi"]



# Iterators
#   In ruby the prefered way to loop through an array is the .each method
#   This is a replacement for the traditional for i in x (can still be used)
    # a = [1, 2, 3]
    # print a # => [1, 2, 3]
    # puts
    # for i in a
    #     puts i # =>1 =>2 =>3
    # end

# .each method (with do)
    # a = [1, 2, 3]
    # a.each do |i|
    #     puts i # =>1 =>2 =>3
    # end

#  .each method (one line)
    # a = [1, 2, 3]
    # a.each {|i| puts i}





#==================================================================#
#            27. Instructor Notes: Arrays and Iterators            #
#==================================================================#

# Array, created by including elements within square brackets:

# a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# The index for an array starts with 0, so in the array above a[0] is 1

# Some methods you can use on arrays:

# arrayname.empty?

# arrayname.include?(itemname)

# arrayname.reverse

# arrayname.reverse! # use ! at the end to change the original array

# arrayname.shuffle

# arrayname.push(30) # will append new element 30 to the end array

# arrayname << 25 # << known as shovel operator will also append new element to the end of the array

# arrayname.unshift("someelement") # will add element "some element" to the beginning of the array

# arrayname.pop # will remove the last element of the array and return 1

# arrayname.uniq # will remove all the duplicates and display (will not change the original array)

# arrayname.uniq! # will remove all the duplicates in the original array

# A range:

# (0..25).to_a

# will create an array with elements from value 0 to 25

# (0..99).to_a.shuffle!

# will create an array with elements from value 0 to 99 in random order

# To loop through an array named y using the .each method and print out the value of each element:

# y.each { |i| puts i }

# In plain terms: For each element i in array y print the value of i

# To execute iteration through an array called names using a block:

# names.each do |randomvariablename| # starts the do block

# puts "Hello #{randomvariablename}" # executes code for each element

# end # ends the do block

# To capitalize (or use another method) on each element of array called names:

# names.each { |randomvariablename| puts "Hello #{randomvariablename.capitalize}" }

# Using the select method to pickup all the odd numbers from an array y:

# y.select { |number| number.odd? } # selects the value and returns it only if the condition is met

# To join the elements of an array named p:

# p.join

# To join the elements of an array with space in between each element:

# p.join(" ")

# To join the elements of an array with dash in between each element:

# p.join("-")










#==================================#
#            28. Hashes            #
#==================================#

# Hashes are also known as dictionaries
# They are made up of key-value pairs
# Look Like: 
#       sample_hash {'a' => 1, 'b' => 2, 'c' => 3 }
#                     ^     ^
#                    key  value
#
# It is common to use strings as the keys for the key value pairs
# Rails also lets you use "symbols"
# Symbols are different than strings they are more like identities
#   Think of attributes like username
# Looks like: 
#       sample_hash{a: 1, b: 2, c: 3}
#       puts sample_hash # => {:a=>1, :b=>2, :c=>3}

# my_details = {'name' => 'Jonah', 'favcolor' => 'red'}
# puts my_details['favcolor']

# Methods and accessing 
    #   To retrieve the value of a given key
        # Specify the hash to retrieve the value from and the key in brackets
            # sample_hash{a: 1, b: 2, c: 3}
            # puts sample_hash[:a] # => 1

    # Retrieve list of keys in a hash
        # .keys method will return an array of keys present in a hash
            # sample_hash{a: 1, b: 2, c: 3}
            # puts sample_hash.keys # =>[:a, :b, :c]

    # Retrieve list of values in a hash
        # .values method will return an array of values present in a hash
            # sample_hash{a: 1, b: 2, c: 3}
            # puts sample_hash.values # =>[1, 2, 3]

    # Execute a method on every value in a key value pair
        # .each do can be used on a hash similar to how it is used on an array 
        # instead of 1 arguement (i in array) you need 2 since there is both a key and a value
            # sample_hash = {a: 1, b: 2, c: 3}
            # sample_hash.each do |key, value|
            #     puts "The class for key is: #{key.class}\nThe class for value is #{value.class}"
            # end
            # => The class for key is: Symbol
            # => The class for value is Integer
            # => (repeat x3)
        # There is a one liner version of this as well
            # sample_hash = {a: 1, b: 2, c: 3}
            # sample_hash.each {|key, value| puts "The key is #{key} and the value is #{value}"}
            # => The key is a and the value is 1
            # => The key is b and the value is 2
            # => The key is c and the value is 3

    # Add a new element to a hash
        # to add a new hash name the hash, name the key as an arguement in [] and set it equal to the value
            # sample_hash = {a: 1, b: 2, c: 3}
            # sample_hash[:d] = "Jonah"
            # puts sample_hash # => {:a => 1, :b => 2, :c => 3, :d => "Jonah"}

    # Change a key's value
        # Do the same as adding a new hash but instead name an existing key as an arguement in []
            # sample_hash = {a: 1, b: 2, c: 3}
            # sample_hash[:c] = "Jonah"
            # puts sample_hash # => {:a => 1, :b => 2, :c => "Jonah"}

    # Filter and return certain values 
        # .select allows you to perform a test on a value
        # if it evaluates to true then that key and value are added to a list of returned keys and values
            # sample_hash = {a: 1, b: 2, c: 3}
            # selected = sample_hash.select {|key, value| value > 1}
            # puts selected # => {:b => 2, :c => 3}





#====================================================#
#            29. Instructor Notes: Hashes            #
#====================================================#

# To create a hash called my_details include the elements within { }:

# my_details = {'name' => 'mashrur', 'favcolor' => 'red'}

# To access the value and notify me what favcolor is:

# my_details["favcolor"]

# Alternate syntax to create key, value pairs in hash:

# myhash = {a: 1, b: 2, c: 3, d: 4}

# But this will create symbols a, b, c and d (not strings) as keys

# To access the value for key c above:

# myhash[:c]

# To add a key, value pair to the hash above:

# myhash[:d] = 7

# myhash[:name] = "Mashrur"

# To delete a key, value pair simply delete the key:

# myhash.delete(:d)

# To list the keys in a hash, followed by values of the hash:

# myhash.keys
# myhash.values
# To iterate through a hash using .each method and print out value:

# myhash.each { |somekey, somevalue| puts somevalue }

# To iterate through a hash using .each method and print out both key and value in friendly format:

# myhash.each { |somekey, somevalue| puts "The key is #{somekey} and the value is #{somevalue}" }

# To iterate through and delete a items from a hash based on a condition (in the condition below if the value is greater than 3:

# myhash.each { |k, v| myhash.delete(k) if v > 3 }

# Use select method to display items only if value of the item is odd

# myhash.select { |k, v| v.odd? }










#===========================================================#
#            30. Homework Project: Authenticator            #
#===========================================================#

# Starting the authenticator project
# Shows welcome
# Has divider line
# Says "This program will take input from the user and compare password"
# Prompts for "Username: " and accepts user input for a username
# Prompts for "Password: " and accepts user input for password
# If password is correct then output the user object
# If the password is incorret then it lets you know 
#   Then gives the option to press a key to quit or any other key to continue
#       If continue is selected then program restarts from after printing divider line (prompts for username)
#   If incorrect 3 times then force exit of the program "You have exceeded the maximum number of attempts"

# A database table will be simulated with an array of hashes containing usernames and passwords
    # users = [
    #   {usernme: "user1", password: "user1pass"},
    #   {usernme: "user2", password: "user2pass"},
    #   {usernme: "user3", password: "user3pass"},
    #   {usernme: "user4", password: "user4pass"},
    #   {usernme: "user5", password: "user5pass"}
    # ]

# Starter code for welcome screen:
    # puts "Welcome to authenticator"
    # 25.times {print "-"}
    # puts "\nThis Program will take input from the user and compare password\nIf password is correct, you will get back the user object"

# We will learn:
#   Hash, Array, Branching, While loops, and designing program execution flow





####################
#   MY SOLUTION    #
####################


####    Methods    ####
# # If user hasn't run out of attempts: Run this method if username or password are incorrect 
# #   Will let them choose whether they want to try again or not
# def try_again
#   puts "Incorrect username or password"
#   puts "Enter Q to quit or any other key to try again"
#   try_reply = gets.chomp # Get user response

#   if try_reply.upcase == "Q" # User chose to quit
#     return false # value returned to while loop
#   else # user chose to try again
#     return true # value returned to while loop
#   end
# end

# # Prompt user for username and password and collect input
# def login_prompt
#   print "Username: "
#   input_user = gets.chomp # Collect username

#   print "Password: "
#   input_pass = gets.chomp # Collect password

#   # Returns multiple values: Both the entered username and password
#   return input_user, input_pass
# end

# # Drives main login functions
# def login_loop
#   ####    "Database"    ####
#   # Stores usernames/password pairs as hashes in an array
#   users = [
#     {username: "user1", password: "user1pass"}, 
#     {username: "user2", password: "user2pass"},
#     {username: "user3", password: "user3pass"},
#     {username: "user4", password: "user4pass"},
#     {username: "user5", password: "user5pass"}
#   ]

#   # Function prompts users for username and password
#   #   Returns username [0], and password [1]
#   login_details = login_prompt()
    
#   # Loop through users array
#   users.each do |i|
#     # Check input_user value matches i :username value
#     if login_details[0] == i[:username]
#       # Check input_pass value matches i: password value
#       if login_details[1] == i[:password] # If they match
#         puts i # Outputs current hash with user data
#         return true # Returns to while loop that login was successful
#         break # Exit current .each loop through array
#       else # Passwords do not match
#         return false # Returns to while loop that login was unsuccessful
#         break # Exit current .each loop through array
#       end
#     elsif i == users.last # Username did not match the last :username value in the array
#       return false # Return to while loop that login was unsuccessful
#       break # Exit current .each loop through array
#     end
#   end
# end


# #Welcome screen that shows on initial load
# def welcome
#     puts "Welcome to authenticator"
#     25.times {print "-"}
#     puts "\nThis Program will take input from the user and compare password\nIf password is correct, you will get back the user object"
# end

# ####    END METHODS    ####

# # Initial values for while loop
# retry_allowed = true
# counter = 1 # Counts how many times the user has attempted to login
# ceiling = 5 # The number of tries that a user has before program exits

# # Display welcome screen
# welcome()

# # Program controller 
# while retry_allowed do
#   # Toggle retry to false if it is the user's last chance
#   if counter >= ceiling 
#     retry_allowed = false
#   end

#   # Run the login loop and store whether the login attempt was successful
#   login_pass = login_loop()
#   if login_pass == true # Login successful
#     counter = 100 # Set counter above ceiling (unnecessary precaution)
#     retry_allowed = false # Make sure the while loop won't restart
#     puts "Login successful. Goodbye."
#   elsif login_pass == false && retry_allowed == true # If the login failed but the user can still retry
#     try_again = try_again() # Try again asks user if they want to retry. Answer stored in try_again
#     if try_again == true # User responds they want to retry
#       counter += 1 # Increase the attempt count
#     else # User responds they do not want to try again
#       counter = 100 # Set counter above ceiling (unnecessary precaution)
#       retry_allowed = false # make sure the while loop won't restart
#       puts "Thank you. Goodbye."
#     end
#   else # Login failed and user is out of attempts
#     puts "You have run out of attempts. Goodbye."
#     counter = 100 # Set counter above ceiling (unnecessary precaution)
#     retry_allowed = false # Make sure while loop won't restart
#     end
# end





#================================================================#
#            31. Authenticator Project Implementation            #
#================================================================#

# # Teacher solution to authenticator project

# # Store array of user hashes w/ usernames and passwords
# users = [
#   {username: "user1", password: "user1pass"}, 
#   {username: "user2", password: "user2pass"},
#   {username: "user3", password: "user3pass"},
#   {username: "user4", password: "user4pass"},
#   {username: "user5", password: "user5pass"}
#   ]

# # Method to check users input and verify login
# def auth_user(username, password, list_of_users)
#   # For each hash in users array
#   list_of_users.each do |user_record|
#       # Check if the username and password match
#       if user_record[:username] == username && user_record[:password] == password
#           # If they do match return the hash and break out of auth_user method
#           return user_record
#           break
#       end
#   end
#   # All hashes in user array was checked and no username/password matches user input
#   return "Credentials were not correct"
# end


# # Welcome screen
# puts "Welcome to the Authenticator"
# 25.times {print "-"}
# puts
# puts "This program will take input from the user and compare password"
# puts "If the password is correct, you will get back the user object"

# # Count number of attempts. Incrememnted inside the while loop
# attempts = 1
# while attempts < 4
#   # Get login info from user
#   print "Username: "
#   username = gets.chomp
#   print "Password: "
#   password = gets.chomp

#   # Run authentication method and store/output whether login was successful or not
#   authentication = auth_user(username, password, users)
#   puts authentication

#   # Allow user to exit while loop
#   puts "Press n to quit or any other key to continue"
#   input = gets.chomp.downcase # downcase in case user uses N
#   break if input == "n"

#   attempts += 1
# end

# # While loop won't run if too many attempts are made so this will run after while loop can't anymore
# puts "You have exceeded the number of attempts" if attempts = 4




### Leson 32 Contains the above teacher solution in text ###










#============================================#
#            33. Ruby Style Guide            #
#============================================#

# More information available at: https://github.com/rubocop-hq/ruby-style-guide

# Common conventions you should use when coding in ruby

# Snake Case
#   Snake case should be used for both method names and variable assignments
#       ex: this_is_snake_case

# Indentation
#   tabs should be 2 spaces

# Class Names
#   Class names should be camel case
#       ex: CamelCase
#   NOTE: TRUE camelcase is more like js with the first letter lowercase
#           ex: camelCase
#         This is not true in ruby since classes must be uppercase










#==============================================================#
#            34. Instructor Notes: Ruby Style Guide            #
#==============================================================#

# Link for style guide:

# https://github.com/rubocop-hq/ruby-style-guide

# https://github.com/bbatsov/ruby-style-guide

# Soft tabs: 2 spaces, convert tabs to spaces

# class names: CamelCase

# class ThisIsCamelCase
#   # code for class
# end
# file names, method names and variable names: snake_case

# Variable assignment:

# this_is_snake_case = "snake case"

# Method definition:

# def method_name
#   # write code here
# end
# Ruby file names:

# this_is_snake_case.rb










#=====================================================================#
#            35. Homework Assignment: Area Code Dictionary            #
#=====================================================================#

# There is a "dial book"
#   dial_book is a hash that contains city name keys with values being the cities area code.
# 
# When run the program should ask if you want to look up an area code associated with a city name
# If a city name is entered the area code for the city should be returned
#

# Prompt: "Do you want to look up an area code based on a city name? (y/n): "
# Get user feedback
# Prompt: "Which city do you want the area code for? #{list of cities each on their own line}"
# Get user feedback
# Return the area code of the city the user selected
# Returns to first prompt

# # Starter code:
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

# ## Get city names from the hash
# def get_city_names(somehash)
#   #write code here
# end

# ## Get area code based on given hash and key
# def get_area_code(somehash, key)
#   #write code here
# end

# ## Execution flow
# loop do
#   puts "Do you want to lookup an area code based on a city name? (y/n) "
#   answer = gets.chomp.downcase
#   break if answer != "y" 
# end





###################
#   MY SOLUTION   #
###################

# # Prompt: "Do you want to look up an area code based on a city name? (y/n): "
# # Get user feedback
# # Prompt: "Which city do you want the area code for? #{list of cities each on their own line}"
# # Get user feedback
# # Return the area code of the city the user selected
# # Returns to first prompt

# # Hash containing keys named after cities and their area code as their values
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

# ## Get city names from the hash
# def get_city_names(dial_book)
#   # Prints each key in the hash
#   dial_book.each_key {|k| puts k}
# end

# ## Get area code based on given hash and key
# def get_area_code(dial_book, key)
#   # See if city name is a key in the hash
#   # If it is in the hash the return the area code and restart do loop
#   if dial_book.has_key?(key)
#     return "The area code for #{key} is #{dial_book[key]}"
#   else # City name was not in the hash
#     return "City not found please try again"
#   end
# end

# ## Execution flow
# loop do
#   # See if user wants to start/continue
#   puts "Do you want to lookup an area code based on a city name? (y/n) "
#   answer = gets.chomp.downcase
#   break if answer != "y" 

#   # Output user options
#   puts "What city do you want the area code for?"
#   get_city_names(dial_book) # Print the city names in the dial book
#   # Retrieve user choice
#   print "Enter your selection: "
#   user_city = gets.chomp.downcase
#   # Search the dial book for the entered city and return the area code
#   # If no area code exists returns an error
#   puts get_area_code(dial_book, user_city)
# end





#=====================================================================#
#            36. Homework Assignment: Area Code Dictionary            #
#=====================================================================#

# Instructor written directions

# 1. Create a dictionary (hash) with 10 city names, where the city name (key) will be a string, and the area code would be the value, an example is given in the resources in the project video

# 2. Display the city names to the user for cities which are available in the dictionary

# 3. Get input from the user on the city name (hint: use gets.chomp method)

# 4. Display area code based on user's city choice

# 5. Loop - keep the program running and prompt the user for new city names to lookup

# 6. Complete the two methods to lookup city names and to find area code based on city names

# 7. Please post your code to the Q & A/discussions area for the video

# Starter template:

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
 
# # Get city names from the hash
# def get_city_names(somehash)
# # Write code here
# end
 
# # Get area code based on given hash and key
# def get_area_code(somehash, key)
# # Write code here
# end
 
# # Execution flow
# loop do
# # Write your program execution code here
# end










#==========================================================#
#            37. Solution: Area Code Dictionary            #
#==========================================================#

# # Teacher solution for area code dictionary

# # Contains city => area code key value pairs
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
 
# # Get city names from the hash
# def get_city_names(somehash)
#   somehash.keys # Returns a list of keys (cities) from the given hash
# end
 
# # Get area code based on given hash and key
# def get_area_code(somehash, key)
#   somehash[key] # Return the area code of the given key
# end
 
# # Execution flow
# loop do
#   # Prompt user to start/continue
#   puts "Do you want to lookup an area code based on a city name? (Y/N)"
#   answer = gets.chomp.downcase 
#   break if answer != "y" # if they do not confirm they want to continue exit loop
#   # Provide list of cities to user
#   puts "Which city do you want to look up the area code for?"
#   puts get_city_names(dial_book)
#   # Receive user selection
#   puts "Enter your selection"
#   prompt = gets.chomp
#   # Check if user selectoin is valid
#   if dial_book.include?(prompt)
#     # If selection is valid return the area code
#     puts "The area code for #{prompt} is #{get_area_code(dial_book, prompt)}"
#   else
#     # If selection is invalid return error
#     puts "You entered an invalid city name"
#   end
# end





#####    38. Soluton: Area Code Dictionary contains same teacher solution as above #####










#=========================================================#
#            39. Practice what you have learnt            #
#=========================================================#

# https://try.ruby-lang.org/ 
# Interactive site that allows you to practice ruby basics
# Takes approximately 30 minutes to complete (allegedly)










#================================================================#
#            40. Intro to Object Oriented Programming            #
#================================================================#

# Object oriented programming (OOP) that uses interactions between objects to drive programs

# All "things" are objects
#   A Thing --> Object
# Objects are created from class "blueprints" to keep things that have the same data (attributes) consistent
#   Features of a thing --> Attribtues of an object 
# Student{:first_name, :last_name, :student_id} <-- Class blueprint
#    ^        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#  Object                Attributes


# A university to keep records would maintain a list of existing students and courses
#   They would have a class that contains a list of all students
#     Each entry in that list would be it's own class that has individual details for each student
#   They would also have a class that contains a list of all courses offered
#     Each entry in that list would be it's own class that has individual details for each of the course
# University
# -----------
# Student
# --students - first name, last name, email, student id
# Course
# -- courses - course name, course description, course id
#
# A bookstore needs both books to sell and employees to sell them and would need to keep details about each
#   One of their classes would be books which would contain a list of all the books they sell
#     Each item in that list would be a class with details on a specific book
#   Another class would be employees which would hold a list of all employees
#     Each item in that list would contain details on an individual employee
# Bookstore
#------------
# Book
# -- book - ISBN, name, description
# Employee
# -- employees -SSn, first name, last name, email, employee id
#
# News Network/Blog Site
# ----------------------
# Article

# How to make a class in ruby
#   Must start with class (similar to how methods must start with def)
#   Class name must be uppercase
#   Class definitions (blueprints) should declare instance variables
#     When working a class you will want to work with a specific instance of the class
#     This means you must use something called an instance variable (@variable)
#     Instance variables specify that you want to work with a specific object of the class being defined
#   closes with end statement
# class Student
#   @first_name
#   @last_name
#   @email
#   @username
#   @password
# end

# Creating a new instance of a class (creating an object from the class blueprint)
# jonah = Student.new
# puts jonah # =>#<Student:0x000055a9ef9af990>
# What is that weird output?
#   This says what the class of the object is as well as a hex representation of the object
#   By default (built in classes have a method called to_s)
#   When an object is called it's default output is the to_s method
#   If undefined it will simply output a hex representation of the object
#   If defined we can make it output more relevant information

# class Student
#   @first_name
#   @last_name
#   @email
#   @username
#   @password

#   def to_s
#     "First name: #{@first_name}"
#   end
# end

# jonah = Student.new
# puts jonah # => First name:
# It shows that there is an attribute for first_name but we did not assign a value

# In order to assign values we have to first define a method in the class that defines how that is done





#=========================================================#
#            41. Intructor Notes: Intro to OOP            #
#=========================================================#

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










#============================================================#
#            42. Attributes, Getters, and Setters            #
#============================================================#

# # In order to assign values to the attribtues (instance variables) that were just created getters and setters are used
# #   Setters
# #     Set values for instance variables when creating or manipulating an objects data
# #     Setters are defined similar to regular methods in a class except they use an (=) between the method name and the arguement it accepts
# #   Getters
# #     Returns an value of an objects attributes (instance variables)
# #     Getters are defined the same as methods with the instance variable specified as the return value

# # class Student
# #   @first_name
# #   @last_name
# #   @email
# #   @username
# #   @password

# #   # How to define a setter
# #   # Slightly different from other methods because of the (=) between the method name and the arguement
# #   def first_name=(name)
# #     @first_name = name
# #   end

# #   # How to define a getter
# #   # Simple method that just has the value of the instance variable as it's return
# #   def first_name
# #     @first_name
# #   end

# #   def to_s
# #     "First name: #{@first_name}"
# #   end
# # end

# # jonah = Student.new
# # jonah.first_name = "Jonah"
# # puts jonah.first_name



# # This is fine for only adding or changing one object but is redundant if there are a lot of attributes
# # Ruby has a built in feature called attribute accessors to prevent us from having a lot of getters and setters
# # Attribute Accessor:
# #   To define use attr_accessor above where instance variables are declared
# #   Then add a list of instance variables that can be accessed with att_acessor
# #     instance variables should be declared as symbols since that is how ruby stores attribute accessors
# #     that is because if they were not stored as symbols there would be an new instance in memory for every object just to store the name of each value for each object
# #     this way the name is only stored in 1 place in memory
# # Now we can assign values to an objects attributes without needing a getter and setter for each specific one
# #
# # Attribute Reader:
# #  Attribute reader works the same as attribtue accessor except it only allows the getter functionality, not the setter

# # class Student
# #   attr_accessor :first_name, :last_name, :email
# #   attr_reader :username

# #   @first_name
# #   @last_name
# #   @email
# #   @username
# #   @password

# #   def to_s
# #     "First name: #{@first_name}"
  
# #   end
# # end

# # jonah = Student.new
# # jonah.first_name = "Jonah"
# # jonah.last_name = "Thompson"
# # jonah.email = "jonah@email.com"


# # puts jonah.first_name
# # puts jonah.last_name
# # puts jonah.email
# # puts jonah.username

# # This is a lot of writing to set up a small object
# # Much larger objects need a better way to set values when we create them
# # To do that we have to use an initialize method
# # Initialize Method:
# #   set like a normal method with def and add attributes to be set in the arguements
# #   inside the method set the instance variables equal to the corresponding arguements passed in

# class Student
#   attr_accessor :first_name, :last_name, :email, :username

#   @first_name
#   @last_name
#   @email
#   @username
#   @password

#   # Setting and intialize method
#   def initialize(firstname, lastname, username, email, password)
#     # Set instance variables equal to the corresponding arguements passed
#     @first_name = firstname
#     @last_name = lastname
#     @username = username
#     @email = email
#     @password = password
    
#   end

#   def to_s
#     "First name: #{@first_name}\nLast name: #{@last_name}\nUsername: #{@username}\nEmail: #{@email}\nPassword: #{@password}"
  
#   end
# end

# jonah = Student.new("Jonah", "Thompson", "jonah1", "jonah@email.com", "pass1")
# anakin = Student.new("Anakin", "Skywalker", "vader1", "lordvader@email.com", "ripleah")

# puts jonah
# puts anakin

# jonah.last_name = anakin.last_name
# puts "Jonah was adopted"
# puts jonah





#==============================================================================#
#            43. Instructor Notes: Attributes, Getters, and Setters            #
#==============================================================================#

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










#====================================================================================#
#            44. Final Ruby Project: Classes, Modules, Mixins: 1 - bcrypt            #
#====================================================================================#

# # More info on bcrypt: https://www.rubydoc.info/gems/bcrypt-ruby/3.1.5

# # What can a class be used for when it comes to an actual application
# # Use case for student calss - Authentication systems in web applications
# # Think of students as users with usernames and passwords
# # Security for user information is very important
# # Passwords are virtually never stored in their string forms
# # Hashed diests are stored in the db's
# # A popular hashing algorithm is bcrypt
# #   bcrypt
# #     hides what a users password is if someone were to figure out how to access the database
# #     does this by accepting a string and returning a hash (string of crazy numbers/letters)
# #     When a user submits their password what they submit is run through the MD5 algorithm and compared to the hash
# #       MD5 is the algorithm that bcrypt uses and adds a "salt" to the password in order to create a hash
# #         Salt: random data that is used in the algorith to help hide the actual string contents
# #     this will determine if the entered password was correct or not

# # In order to use bcrypt it must be installed as a "gem"
# #   gems are plugins in ruby that allow for extra functionality
# # For bcrypt use: (in terminal)
# #   $gem install bcrypt
# # 
# # To add a gem simply add it as required at the top of a ruby file:

# require 'bcrypt' # tells ruby that bcrypt willbe needed

# # Uses BCrypt Password class create method and passes in a string
# # This will save my_password as a long hashed version of the entered text after it was ran through the MD5 algorithm
# my_password = BCrypt::Password.create("my password")

# puts my_password  # =>$2a$12$GAy0dyu.JzHHNkdPnUSHvu06UjzC.HZL2kCQND2GN4/Kh3nsx5mla (will be different each run)
# puts my_password.version # =>2a
# puts my_password.cost # =>12
# puts my_password == "my password" # =>true
# puts my_password == "wrong password" # =>false






#=========================================================================#
#            45. Instructor Notes: Final Ruby Project 1 bcrypt            #
#=========================================================================#

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










#=====================================================================================#
#            46. Final Ruby Project: Classes, Modules, Mixins: 2 - Methods            #
#=====================================================================================#

# require 'bcrypt' # tells ruby that bcrypt willbe needed

# # Uses BCrypt Password class create method and passes in a string
# # This will save my_password as a long hashed version of the entered text after it was ran through the MD5 algorithm
# my_password = BCrypt::Password.create("my password")
# my_password_1 = BCrypt::Password.create("my password")
# my_password_2 = BCrypt::Password.create("my password")


# # Even if the same password is made multiple times each time it will generate a different hash
# puts my_password   # =>$2a$12$GAy0dyu.JzHHNkdPnUSHvu06UjzC.HZL2kCQND2GN4/Kh3nsx5mla
# puts my_password_1 # =>$2a$12$BNt092aVKqorGDmBJuGLO.HRezwI3sljBJHKdPNXBueTJsBEecUCi
# puts my_password_2 # =>$2a$12$.HDLnYUXtmfnMAmO40/9JuY/tSMIFdVHtr5lfcnc1wSObRdCJVVDS

# # But if you compare 2 hashes created with the same string it will be false since the hashes are not equal
# # This means in order to know the value of the hash you have to provide the string that it is equal to
# # The hash will only tell you if you are correct but by design cannot tell you the value of the string it is coding
# puts my_password == my_password_1

# # This shows that the algorithm is 2 way and will encrypt and decrypt the string back and forth
# my_password = BCrypt::Password.new("$2a$12$GAy0dyu.JzHHNkdPnUSHvu06UjzC.HZL2kCQND2GN4/Kh3nsx5mla")
# puts my_password == "my password" # => true


# # How do we use this to store user passwords?

# require 'bcrypt'

# # List of users starts with unsecure string passwords
# users = [
#           {usernme: "user1", password: "user1pass"},
#           {usernme: "user2", password: "user2pass"},
#           {usernme: "user3", password: "user3pass"},
#           {usernme: "user4", password: "user4pass"},
#           {usernme: "user5", password: "user5pass"}
# ]

# # Takes plain text and converts it into a hashed version
# def create_hash_digest(password)
#   BCrypt::Password.create(password)
# end

# # Check that the plaintext that was entered matches the hash (must be set equal to a user input)
# def verify_hash_digest(password)
#   BCrypt::Password.new(password)
# end

# # Loop through unsecure users array, creates a hash for each password, and overwrites the old password with the hash
# def create_secure_users(list_of_users)
#   list_of_users.each do |user_record|
#     user_record[:password] = create_hash_digest(user_record[:password])
#   end
#   # Return the now hashed list to the caller
#   return list_of_users
# end

# # Outputs the users array now with hashed passwords
# puts create_secure_users(users)





#============================================================================#
#            47. Instructor Notes: Final Ruby Project: 2 - Mixins            #
#============================================================================#

# # We created a crud.rb file and filled it in:

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










#===============================================================#
#            48. Final Ruby Project: CMM 3 - Modules            #
#===============================================================#

# Above we made a small program that essentially takes a password, converts it to a hash, and stores it with a username

# In order to keep code clean things that can stand alone can be seperated into their own file and called only where needed
# This helps keep things secure since data can be kept sepearte and keeps code more clean and readable
# This is similar to how we use functions for organization or to use them in multiple places
# This is called a module 
# As a reminder the below is the authentication functions we will make into a module

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

# puts create_secure_users(users)

# # This does a check comparing provided username and password with the usernames and passwords in the users array
# def authenticate_user(username, password, list_of_users)
#   list_of_users.each do |user_record|
#     if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
#       return user_record
#     end
#   end
#   "Credentials were not correct"
# end

# puts authenticate_user("heisenberg", "password5", users) # Correct password returns user object
# puts authenticate_user("heisenberg", "password6", users) # Incorrect password returns error





### To make  this into a module:
# add module module_name to the very top of the page with an end tag at the end
# Everything should be indented within the module tag
# (COPY Crud MODULE INTO A NEW FILE crud.rb then continue below module for instruction)

# module Crud
#   require 'bcrypt'


#   # Turns a given password into a hash and returns the hash
#   def create_hash_digest(password)
#     BCrypt::Password.create(password)
#   end

#   # Verifies that a given password authenticates with a stored hash
#   def verify_hash_digest(password)
#     BCrypt::Password.new(password)
#   end

#   # Hashes the passwords from an array of user objects for each user object
#   def create_secure_users(list_of_users)
#     list_of_users.each do |user_record|
#       user_record[:password] = create_hash_digest(user_record[:password])
#     end
#     list_of_users
#   end

#   # This does a check comparing provided username and password with the usernames and passwords in the users array
#   def authenticate_user(username, password, list_of_users)
#     list_of_users.each do |user_record|
#       if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
#         return user_record
#       end
#     end
#     "Credentials were not correct"
#   end
# end

#### END OF CRUD MODULE ####



# # if the module is in the same directory use require_relative and the name of the module
# require_relative 'crud'

# users = [
#           { username: "mashrur", password: "password1" },
#           { username: "jack", password: "password2" },
#           { username: "arya", password: "password3" },
#           { username: "jonshow", password: "password4" },
#           { username: "heisenberg", password: "password5" }
#         ]

# # To access crud methods
# hash_users = Crud.create_secure_users(users) # This won't do anything currently except output "Crud module called"
# # This shows that the module is being called but for some reason it cannot run the function create_secure_users
# # For the methods to be available to be called from the module you have to add self. at the beginning of each method within the module
# # After adding .self this will now work 
# puts hash_users





#=============================================================#
#            49. Instructor Notes: FRP 3 - Modules            #
#=============================================================#

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










#============================================================#
#            50. 'self' Notation for Method Names            #
#============================================================#

# self. can be used instead of ModuleName. on methods in a module










#===============================================================#
#            51. Final Ruby Project: CMM 4 - Include            #
#===============================================================#

# # Last time we created the crud module to hash and authenticate user passwords
# # Now lets do it with a user object that is a little more complex like Students
# # We will be using a class and giving it access to methods within that module
# # This way the class can hash it's own password and would have a method built into it to authenticate

# # To include module methods as part of a class (so they can be accessed by instances, in this case individual students)
# # You must include require_relative 'moduleName' as normal
# # You must also add include Module name inside the class itself
# #   When this is done you must remove self. notation from the module
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

# # After removing the self. (ModuleName.) notation from the module this will work and return the hashed form of mashrur's password
# hashed_password = mashrur.create_hash_digest(mashrur.password)
# puts hashed_password










#=============================================================#
#            52. Instructor Notes: FRP 4 - Include            #
#=============================================================#

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


#===========================================#
#            SECTION 2. COMPLETE            #
#===========================================#