# Example of a module in ruby
# Here we have combined several methods that can be used to hash user passwords
# We could use this module elsewhere and call this module wherever it is needed
# self is used to define that this method should be publicly available
# When used as 'include' in a class self. (HashPass.) is not required before each method
module HashPass
    # bcrypt is used to generate and compare hashes and passwords
    require 'bcrypt'
    puts "Module HashPass activated"


    # Create a hashed version of a password
    def create_hash_digest(password)
        BCrypt::Password.create(password)
    end

    # Verify if an entered string matches the hash when processed by BCrypt
    def verify_hash_digest(password)
        BCrypt::Password.new(password)
    end


    # Create hashed passwords for a list of user objects
    def create_secure_users(users)
        # Loop through a list of users
        users.each do |user|
            # Hash each user in the list's password
            user[:password] = create_hash_digest(user[:password])
        end
        users
    end

    # Check a list of users to see if the username and password match what was entered
    def authenticate_user(username, password, users)
        # Loop through list of users
        users.each do |user|
            # Check if the current users username and password match what was passed
            if user[:username] == username && verify_hash_digest(user[:password]) == password
                # If it matches return the user object
                return user
            end
        end

        # After all users have been looped through and checked if there is no match
        "Credentials were not correct"
    end
end
