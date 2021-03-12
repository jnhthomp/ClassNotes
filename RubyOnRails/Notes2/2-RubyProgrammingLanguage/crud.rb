module Crud
  require 'bcrypt'

  # Verify when the module is called for testing purposes
  puts "Crud module called"

  # Turns a given password into a hash and returns the hash
  def create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  # Verifies that a given password authenticates with a stored hash
  def verify_hash_digest(password)
    BCrypt::Password.new(password)
  end

  # Hashes the passwords from an array of user objects for each user object
  def create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] = create_hash_digest(user_record[:password])
    end
    list_of_users
  end

  # This does a check comparing provided username and password with the usernames and passwords in the users array
  def authenticate_user(username, password, list_of_users)
    list_of_users.each do |user_record|
      if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
        return user_record
      end
    end
    "Credentials were not correct"
  end
end