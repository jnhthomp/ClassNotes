#=====================================================#
#       124. Intro to Section 6 and Associations      #
#=====================================================#

# Users table
    # ID (rails generated)
    # username
    # email

    # Model name
        # User
    # table name
        # users
    # model name filename
        # user.rb
    # controller name
        # users_controller.rb

# When creating an article we want to know who created it
# So we are going to add a new column to the articles table called user_id
    # user_id will correspond to an ID in the users table of who submitted the article
    # we can use the id to determine which user created it
    # users can create multiple articles but an article can only have 1 user
    # this is called a 1 to many relationship

# Let's try it in test_app_5 first
# Generate user scaffold
    # $rails generate scaffold User username:string email:string
    # $rails db:migrate
# Test it out in rails console
    # $rails console
    # Make sure we can access the table
        # $User.all
        # $User
            # Should show the layout for a user row item but should not contain any data yet
    # Create some new rows in the table
        # $user = User.create(username: "John", email: "john@example.com")
        # $user = User.create(username: "Jack", email: "jack@example.com")
        # $User.all => list of users in User table

# Create another table called Comments that will have a users ID assocaited as a foreign key
    # rails generate scaffold Comment description:text references:user
    # rails db:migrate

# Now we have to build the association
    # in ~app/models/user.rb class User
        # has_many :comments
        # This defines the relationship between the users and comments table

# Create an article that uses this association
    # $rails console
    # $user = User.first => the user that will be making a comment saving to user variable to make things simple
    # $user.comments => Won't really return anything because this user hasn't made any comments
    # $comment = Comment.new(description: "This is a description", user: user) => Create a new comment and assign user_id to user attribute
    # $comment.save => save the current comment
    # $user.comments => returns the comment that we just made since it contains the current users foreign key if there are multiple it would return all comments
    # $comment.user => returns the user who created the current comment. Will only return 1 user since only 1 user can create a comment




















#==============================#
#       126. Create Users      #
#==============================#

# Let's use what we learned in the last lesson to create a users table for the alpha blog app
# alpha_blog
# Since the master branch is currently working pretty well we are going to create another branch. This way if we mess up the branch we can revert our changes easily and master will remain deployable to production.
    # $git checkout -b create-users => creates new branch called create-users
    # $git branch  => shows all branches with an asterisk next to your current branch
    # $git checkout master => switches to master branch
    # $git checkout create-users => switches to create-users branch

# Now we are in a "safe" branch that will not affect master lets create a new migration for the table 
    # $rails generate migration create_users => Creates migration file to create users in ~db/migrate/89348439857_create_users.rb
    # Go to this created migration file 
    # Inside the "create_table users do" block
        # t.string :username
        # t.string :email
        # t.timestamps

# Now we can run the migration
    # $rails db:migrate => Creates users table

# Create the model
# create ~app/models/user.rb
# In this file create the class that will be used
    # class User < ApplicationRecord
    #
    # end
# Now in rails console
    # $User.all
    # $User => Returns table layout
# Create a user
    # $user = User.create(username: "John", email: "John@example.com")
    # $user = User.find(1) => assign the newly created user to the user variable so we can work with it more easily
    # $user.email = "john1@example.com" => edit current value for email
    # $user.save => save the changed email
    # $user = User.find(1)
    # $user.destroy => delete the user
    # $User.all => the user that was created should be deleted now
# We can tell that all CRUD actions are working for user

# Now we are ready to add the feature branch for create-users to the master branch
    # $git status => show changes that were made 
    # $git add -A => add all of the changes
    # $git commit -m "Create user table and model" => Commits changes to create-users branch
    # $git checkout master => Notice that the model and migration file are gone now
    # $git merge create-users => merge create-users to master branch
# Feature branch has been merged so we no longer need it
    # $git branch -d create-users




















#================================#
#       127. Teacher Notes:      #
#================================#

# Create Users - Text directions and code
# To create a feature branch:

# git checkout -b nameofbranch

# To create a feature branch named create-users:

# git checkout -b create-users

# To view list of branches:

# git branch

# To move to master branch:

# git checkout master

# To move to already created feature branch:

# git checkout nameofbranch

# Important to remember is to always have master branch deployable to production and work on all new features and additions in feature branches

# To create a migration to create users table:

# rails generate migration create_users

# Then within the migration file add in the following within the create_table block to add the username, email and timestamps columns (created_at and updated_at):

# t.string :username

# t.string :email

# t.timestamps

# To run the migration file and create the users table:

# rake db:migrate

# Add a user.rb model file under app/models folder and fill in the following:

# class User < ActiveRecord::Base

# end

# Then start rails console and test out connections:

# rails console

# User.all

# User

# user = User.create(username: "test", email: "test@example.com")

# user = User.create(username: "test2", email: "test2@example.com")

# To grab first user and update their email address:

# user = User.find(1)

# OR

# user = User.first

# user.email = "test3@example.com"

# user.save

# To destroy user with id = 2:

# user = User.find(2)

# user.destroy

# To make a commit of the changes made in the feature branch:

# git add -A

# git commit -m "create users table and user model"

# To merge the changes in the feature branch to the master branch first switch to master branch:

# git checkout master

# git merge nameofbranch

# git push to push code to repository

# To delete a feature branch that is no longer needed and has been merged to master already:

# git branch -d nameofbranch

# To delete a feature branch that is no longer needed but has NOT been merged to master:

# git branch -D nameofbranch




















#======================================#
#       128. Add User Validations      #
#======================================#

# Adding validations to user items
    # Username must be entered
    # Username must be unique
    # Email must be entered
    # Email must be unique
    # validate email format using regex

# Create a feature branch for validations
    # $git checkout -b user-validations

# validation tools
    # guides.rubyonrails.org/active_record_validations.html

# in ~app/models/user.rb class User
    # validation for username
        # set username != nil and length is in acceptable range
            #  validates :username, presence: true, length: { minimum: 3, maximum: 25}
        # test that presence and length validation work in rails console
            # $user = User.new(username: "jo", email: "hello")
            # $user.save => won't save and will return an error because username is too short
            # $user.errors.full_messages => "Username is too short (minimum 3 characters)"
        # set username must be unique (change existing validation line to add [uniqueness: true])
            # validates :username, presence: true, uniqueness: true, length { minimum: 3, maximum: 25}
        # test that uniqueness check works in rails console
            # $reload!
            # $user.username = "joe"
            # $user.save => should successfully save the user item to the database since name length is valid
            # $user = User.new(username: "Joe", email: "anything")
            # $user.save => this will return an error and not save because there is already an item in the table with the name Joe
            # $user.errors.full_messages => "Username has already been taken"
        # What if we try an alternate capitalization patter for the username?
            # $user.username = "joe"
            # $user.save => Successful!
            # To fix this we can add a case sensitive constraint to the uniqueness parameter that we set earlier
                # validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
                    # This will validate that it is unique outside of just how it is capitalized
        # Test that alternate capitalization isn't allowed in rails console
            # $reload!
            # $user = User.new(username: "joE", email: "anything")
            # $user.valid? => false
            # $user.save => throws error, won't save 
            # $user.errors.full_messages => "Username has already been taken"

    # Validation for email
        # Going to set mostly the same stuff with one thing called format
            # validates :email, presence: true,
            #   uniqueness: {case_sensitive: false},
            #   length: {maximum: 105},
            #   format: {with: VALID_EMAIL_REGEX} <== New thing
        # now above the validates statement we just wrote
            # Rubular.com can be used to test regular expressions
            # VALID_EMAIL_REGEX: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        # Check that email validation works correctly in rails console
            # $reload!
            # $user = User.new(username: "Jake", email: "jake@example.com")
            # $user.valid? => true
            # $uesr.save => saves user item to user table
            # $user = user.new(username: "Delaney", email: "delaney@example")
            # $user.valid? => false
            # $user.errors.full_messages => "email is invalid"

# Merge back to master and commit changes
    # $git add -A
    # $git commit -m "Added user validations"
    # $git checkout master
    # $git merge user-validations
    # $git branch -d user-validations
    # $git push




















#===============================#
#       129. Teacher Notes      #
#===============================#

# Add User Validations - Text directions and code
# Validations for User class:

# - username must be present and unique

# - email must be present and unique

# - validate email format using regex

# user.rb model file after validations added:

# class User < ActiveRecord::Base

# validates :username, presence: true,

# uniqueness: { case_sensitive: false },

# length: { minimum: 3, maximum: 25 }

# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

# validates :email, presence: true, length: { maximum: 105 },

# uniqueness: { case_sensitive: false },

# format: { with: VALID_EMAIL_REGEX }

# end




















#=========================================#
#       130. One to Many Association      #
#=========================================#

# Now create an association between users and articles
# To do this we need to add a user_id column in the articles table

# Creating a new git feature branch so we don't mess up our current tables and can revert if necessary
    # $git checkout -b userarticle-association

# Create a migration file to add column
    # $rails generate migration add_user_id_to_articles

# Now we have a new file in ~db/migrate/238494357_add_user_id_to_articles.rb
# in the change function of this file:
    # What you want to do, what table to do it, name of the column being added, type of data to go in that column
    # add_column :articles, :user_id, :integer

# run migration
    # $rails db:migrate

# Check that the column was added in rails console
    # $rails c
    # $Article.all
# Notice that each article has a new attribute called "user_id:"" with value "nil"
# This isn't ideal but since this is a development database we can drop it and recreate it whenever we want and don't have to worry about that

# Now in ~app/models/user.rb above all other functions
    # has_many :articles

# Now in ~app/models/article.rb above all other functions
    # belongs_to :user

# Associations have been set up!
# We want to use validation to require a user_id with every article submitted
# in ~app/models/article.rb add a new line for validation for the user_id
    # validates :user_id, presence: true

# Really quick we also want to store emails in lowercase in our database. In ~app/models/user.rb below the has_many line
    # before_save { self.email = email.downcase }

# Test that associations are set up correctly
    # Create a new article in rails console
        # article = Article.new(title: "this is an article", description: "New article description")
        # article.valid? => false
        # article.save => Error
        # article.errors.full_messages => "User must exist" "User can't be blank"
        # article = Article.new(title: "This is an article", description: "New aticle description", user: User.first)
        # article.valid? => true
        # article.save => success

# Validation Works!

# But there is an issue. Now we can't save any articles from the UI because there is no way to enter a user_id when submitting an article. In fact we can't edit any articles either because they can't be saved without updating the value of user_id
# When we implement authentication it will use the user id of whoever is logged in but until then we will have to provide it manually
# For now we can hardcode it in the articles controller temprorarily
# In ~app/controllers/articles_controller.rb
    # We need to provide a user
    # First in console:
        # Grab last article with user_id
            # $article = Article.last
        # $article.user => Returns user object! This is possible because of the association
        # $user = User.find(2)
        # $user.articles => Returns the articles that have a matching user_id! The one to many relationship can be used to find information both ways
    # Now in ~app/controllers/article_controller.rb in create function
        # @article.user = User.first
    # Save this and create a new article in the UI
    # Back in rails console
        # Article.last => Article that was made in the UI with a user_id assigned




















#================================#
#       131. Teacher Notes:      #
#================================#

# One to Many Association - Text directions and code
# To generate a migration to add user_id column to articles table:

# rails generate migration add_user_id_to_articles

# Then within the change method:

# add_column :articles, :user_id, :integer

# Then run the migration file to effect the change:

# rake db:migrate

# Add the following line to article.rb model file:

# belongs_to :user

# Add the following line to user.rb model file:

# has_many :articles

# Also add the following line to user.rb model file(this has nothing to do with the association):

# before_save { self.email = email.downcase }

# Ensure you have a couple of users created by using the rails console. Then add in 1 line to grab a user to the create action to temporarily hardcode a user to articles:

# def create

# @article = Article.new(article_params)

# @article.user = User.first

# if @article.save

# flash[:success] = "Article was successfully created"

# redirect_to article_path(@article)

# else

# render 'new'

# end

# end

# Ensure you get rid of the debugger line if you no londer need it within the create action, you can add that line as you need to your actions if you want to pause execution of a request

# You can add in the following line to display the debug(params) to your development environment UI output:

# (this will be in the app/views/layouts/application.html.erb file under render footer and above </body>)

# <%= debug(params) if Rails.env.development? %>




















#============================================#
#       132. Show User Info In Articles      #
#============================================#

# We want to show some of the user info to the articles listing page
# Have server running 
# On the articles listing page that shows all created articles
    # Add who created it, and when it was created
    # This is stored in ~app/views/articles/index.html.erb
        # This is where we will add the user data
        # We want to put it in the article body above the article actions
        # in "article-body" div below the description:
            # <small>Created by: <%= article.user.username %>, <%= time_ago_in_words(article.created_at) %> ago, last updated: <%= time_ago_in_words(article.updated_at) %> ago</small>




















#================================#
#       133. Teacher Notes:      #
#================================#

# Show User Info in Articles - Text directions and code
# Add the following code to the index.html.erb file under app/views/articles folder within the div for article-body and under the article.description:

# <div class="article-meta-details">

# <small>Created by: <%= article.user.username if article.user%>,

# <%= time_ago_in_words(article.created_at) %> ago,

# last updated: <%= time_ago_in_words(article.updated_at) %> ago</small>

# </div>

# And then add styling to a new article-meta-details class in the custom.css.scss page under the app/assets/stylesheets folder:

# .article-meta-details {

# border-top: 1px solid #eaeaea;

# margin-top: 15px;

# }