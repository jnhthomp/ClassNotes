#===================================================================#
#            Section 4. CRUD Operations In Ruby on Rails            #
#===================================================================#










#==============================================================#
#            75. Preview of Alpha Blog App and Info            #
#==============================================================#

# Preview of the app moved to section 1, lecture 11, please take a look at section 1 lecture 11 to preview this app. 

# The github repo's for the completed apps using Rails 4 and Rails 5 are provided below:

# Rails 4.2.5: https://github.com/udemyrailscourse/alpha-blog-11-2017-4.2.5

# Rails 5.1.4: https://github.com/udemyrailscourse/alpha-blog-11-2017-5.1.4















#===========================================================================#
#            76. Section 4 Intro: Tables, Migrations, and Naming            #
#===========================================================================#

# This section is going to focus mostly on databse manipulation and models
# We will be creating what we did at the end of Section 3 from scratch 
#   That way we can better understand exactly what is happening behind the scenes

# Rails Naming Conventions (Using "Articles" as an example)
# Model
#   article
#     Models define characteristics for an individual row in a table so it is singular and lowercase
#   File name: article.rb
#   Class name: Article (Since classes are uppercase)
# Table
#   articles
#     A table holds many rows of articles so it is plural and lowercase
# Controller
#   article_controller
# Views
# 

# The first thing we need to create is the articles table
# It will have:
#   id
#     auto generated and maintained by rails 
#     Each id is unique
#     The id being unique makes it the "Primary key"
#   title
#     type: string
#       titles are short so string will work well
#       strings have character limit of 255 characters
#   description
#     type: text
#       Allows for longer descriptions than string

# First we want to generate a migration file
# We can do that in terminal with:
#   $rails generate migration create_articles
#     create_articles will be the name of the migration file
#     we want it to be easy to understand what it does and needs to be snake case
#
# This has created a file db/migrate/20200902015307_create_articles.rb (numbers are based on date and time of generation UTC)
# content of file:
#   class CreateArticles < ActiceRecord::Migration[6.0]
#     def change
#       create_table :articles do |t|
#       end
#     end
#    end

# Because of the way we named create_articles rails was smart enough to know we wanted to create an articles table 
# Looking in the create_table method we can see that it is going to create a table but there are no attributes or details
# We have to add the columns of the table ourselves in this do block
# For now just add a title
# update 'create_table :articles do |t|' block to:   
#   create_table :articles do |t|
#     t.string :title
#   end

# Rails can only run migrate files that haven't been run on the project before
# Run the new migration with the updated create_table method in terminal
#   $rails db:migrate

# Now the articles table has been created
# You can see this in the db/schema.rb file
# It has a line showing to create a table
#   also lists t.string "title"
#     this means there should be a column named title with a type of 'string'

# Since rails only runs migrate files once if we try to run this again nothing will happen

# But we forgot to add description!
# One way we can go back is to run a rollback
# This is not the prefered way to do this but we are going to learn it for educational purposes
#   Why not?
#     You are likely to work with multiple migration files and would have to undo each one if you realized you made a mistake
#     Sometimes these are shared and migration files will be run on their machine and downloads changes their tables will be wrong
#      unless they do a rollback which can mess up their work
#   What is preferred?
#     Create a new migration file so that way when they run db:migrate everything will sync nicely

# To roll back (so it's like $rails db:migrate was never ran): [Not Preferred]
#   $rake db:rollback
#     This will undo the most recent db:migrate

# Now the articles table is gone and is missing from the schema
# Since the last db:migration was undone we can edit the migration file to add description and rerun db:migrate
# In db/migrate/YYYYMMDDHHMM_create_articles.rb:
#   create_table :articles do |t|
#     t.string :title
#     t.text :description <-- This is the line we are adding
#   end
# Save and rerun:
#   $rails db:migrate

# Now the schema shows both a title and description for the articles table

# Add a forgotten/missing/new column [Preferred Way]
# We are going to add timestamps to the database so we can see when articles are created

# We will have to create a new migration file:
#   $rails generate migration add_timestamps_to_articles

# Since this change name was generic it didn't know what change to make but did give us a scaffold to use
# We will have to add our own code to this
# In db/migrate/YYYYMMDDHHMM_add_timestamps_to_articles.rb: (in change method)
#   def change
#     add_column :articles, :created_at, :datetime
#     add_column :articles, :updated_at, :datetime
#   end
#
# add_column is a method that creates a new column in a table and takes 3 arguements
#   add_column :tablename, :column_name, :datatype 
#
# Save the migration file and run:
#   $rails db:migrate
#
# This runs the migration file we just created/edited but not the first one we made since it has already been run before 

# Now looking in the schema file we can see that the articles table has 4 columns listed
#   t.string "title"
#   t.text "description"
#   t.datetime "created_at"
#   t.datetime "updated_at"










#================================================================#
#            77. Instructor Notes: Intro to Section 4            #
#================================================================#

# You can take a look at all code-changes made in this video at: https://github.com/udemyrailscourse/alpha-blog-6/commit/05b1ad6dd72231f3d2ea378479d88d4bf68848ad

# The additions are shown in green and removals are shown in red.

# Details
# Model name: article

# Class name: Article -> Capitalized A and singular, CamelCase

# File name: article.rb -> singular and all lowercase, snake_case

# Table name: articles -> plural of model name and all lowercase

# Additional example:

# Model name: user

# Class name: User -> Capitalized U and singular, CamelCase

# File name: user.rb -> singular and all lowercase, snake_case

# Table name: users -> plural of model name

# Generate a migration to create a table (in this example articles):

# rails generate migration create_articles

# To add attributes for the table in the migration file, add the following inside create_table block:

# t.string :title

# To run the migration file, run the following command from the terminal:

# rails db:migrate

# The first time you run the migration file, it will create the database, the articles table and a schema.rb file.

# To rollback or undo the changes made by the last migration file that was run, you may use the following command:

# rails db:rollback

# If you have run the rollback step, then you can update the previous migration file and add the following line to add a description attribute (column) to the articles table:

# t.text :description
# To run the newly edited migration file again, you can run rails db:migrate

# Note: This above line will only work if you had rolled back the prior migration.

# To generate a new migration file to add or make changes to your articles table you can generate a new file:

# rails generate migration name_of_migration_file

# Then within the def change method in the migration file you can add the following lines:

# add_column :articles, :created_at, :datetime
# add_column :articles, :updated_at, :datetime
# You can run the newly created migrations file by running rails db:migrate from the command line and check out the schema.rb file to check that the changes were reflected properly.















#====================================================#
#            78. Models and Rails Console            #
#====================================================#

# In the last lesson we created articles table w/ title, description, created_at, and updated_at

# Now we need a way to communicate with that table from our application
# In order to do that we have to create a Model
# Remember a model is what communicates with the contoller in the MVC methodology

# Model is going to be call Article and the file is going to be called article.rb
# This goes in app/models/article.rb <-- Create this file

# Every model we create will inherit from the app/models/application_record.rb file

# In app/models/article.rb (should be blank until now)
#   class Article < ApplicationRecord
#
#   end

# This is all we need to have a working model and allows us to communicate with the database.
# This also gives us access to getters and setters so we can work with the articles table and create actions
# We are going to use the rails console in order to do this
# Make sure terminal is in correct directory
# To start terminal use:
#   $rails console (alternate: $rails c)
#
# This gives an interactive terminal we can use to run ruby on our app from the terminal



#### Rails Console Commands ####
#
# See contents of Articles table
#   $Article.all
#
# Create a new row in the Articles table [Not preferred]
#   $Article.create(title: "first article", description: "description of first article")
#     Now using Articles.all there should be an entry
#     Notice that the created_at and updated_at were filled automatically
#     id was also filled automatically
#
# Create a new row in the Articles table with article object variable[Preferred]
#   $article = Article.new
#     This will create a new object that can be added to the articles table
#       stored as a variable called article
#     Notice that the id is nill since it hasn't been added to the table yet
#     Currently it is just an object that has the same attributes as a row entry
#
# Update attributes of an object variable for a row entry
#   $article.title = "second article"
#   $article.description = "description of second article"
#     Now the article object has a title and description
#     The only values missing are id, created_at, and updated_at
#       These are all handled by ruby when an item is added to the table
#       so it is ready to push to the table
#
# Push an object to the database table
#   $article.save
#     adds the article object to the database table
#     Now we can see both entries in the articles table
#     At this point id, created_at, and updated_at are filled by rails
#
# Add an article object variable for a row entry
#   $article = Article.new(title: "third article", description: "description of third article")
#     This fills the specified attributes with the provided data 
#     This doesn't save so you still have to run $article.save
#
# Exit rails console
#   $exit

# Now our database has 3 articles in the articles table










#======================================================================#
#            79. Instructor Notes: Models and Rails Console            #
#======================================================================#

# To create an article model, create an article.rb model file under app/models folder and fill it in:

# class Article < ApplicationRecord

# end

# Note: Make sure ApplicationRecord is CamelCase.

# Now, provided you have the articles table already, you can use the Rails console and work with the articles table using this article.rb model file.

# To start the rails console, type in rails console  or rails c from the terminal.

# Once in the console, you can exit it at any time by typing in exit followed by enter/return.

# You can test out your connection to the articles table by typing the following command from within your rails console:

# Article.all

# If you get an empty collection/array-like structure as a response, you're good to go.

# To create a new article, you can use any of the following methods:

# Article.create(title: "first article", description: "Description of first article") # make sure Article is capitalized if using this method
# article = Article.new
# article.title = "second article"
# article.description = "description of second article"
# article.save
# article = Article.new(title: "third article", description: "description of third article")
# article.save
# To check all the articles that exist in your articles table, you can use the following command:

# Article.all















#==============================================================#
#            80. CRUD Operations From Rails Console            #
#==============================================================#

# In the last lesson we saw how to create a new row in rails console
# Now let's look at the other 3 functions Read, Updaet, and Delete

# Get on rails console in alpha-blog project 
#   $rails c

# We only know how to look at all of the articles in the article table with $Article.all
# What if we wanted to just know what the title and description are based on the id?

# To read an article w/ specific id:
#   $Article.find(2)
#     The arguement is the id of the article you want to find
# 
# Read first article but don't know the id
#   $Article.first
#     first id won't always be 1 since rows can be deleted
#
# Read the last article but don't know id
#   $Article.last
#
# How to do something with the article we fetched?
#   $article = Article.find(2)
#
# If we wanted we could use a variable to get all articles in the table
#   $articles = Article.all
#
# Only see specific attributes of an article
#   $article.title # => "second article"
#
# Change specific attributes of an article
#   $article.description = "edited - description of second article"
#     We still have to save the object to the table before the table will reflect theses changes
#     $article.save
#
# Now how do we delete?
#   $article = article.last
#   $article.destroy
#     This will save the delete to the table and the object will not exist in the database
#     Looking at $Articles.all you can see the last entry is now gone
#
# Now we can do all the CRUD actions in the rails console

# The issue remaining is that because the model is empty, all CRUD actions are allowed
# This means you can get blank entries which we want to avoid










#=============================================================================#
#            81. Instructor Notes: CRUD Actions from Rails Console            #
#=============================================================================#

# To find an article by id you can use the find method like below:

# Article.find(1) # replace 1 with id of article you want to find

# You can save this to a variable and use it like below

# article = Article.find(1)
# article.title # to display (get) the title
# article.description # to display (get) the description
# You can use the methods below to view the first and last articles of the articles table:

# Article.first # display the first article in the articles table
# Article.last # display the last article in the articles table
# You can update an article by finding it first and then using setters for the attributes that the model provides like below:

# article = Article.find(id of article you want to edit)
# article.title = "new title"
# article.description = "new description"
# article.save
# You can delete an article by using the destroy method. A sample sequence could be like below:

# article = Article.find(id of article you want to delete)
# article.destroy















#=======================================#
#            82. Validations            #
#=======================================#

# More info: https://guides.rubyonrails.org/active_record_validations.html

# Now we want to add validations to the user model
# That way we can avoid having useless empty entries 
#   or double check that required data has been entered

# Open rails console $rails c

# First validate title field
#   Make sure that the title field is not blank
#   in app/models/article.rb: (in Article class)
#     validates :title, presence: true

# Save and reload ruby console ($reload!)
# Test if it worked
#   Create a new article without a title field and try to save it
#     $article = Article.new
#     $article.save # =>false 
#
# See why it won't save
#   $article.errors.full_messages
#     This returns a message saying "title can't be blank"

# We can see our validation worked!

# Now let's do the same for description
# Validate description field
#   Make sure description can't be blank
#   in app/models/article.rb: (in Article class)
#     validates :title, presence: true
#     validates :description, presence true <-- Add this line
#
# Reload the rails console

# Try to save an article object with a title but WITHOUT a description
#   $article = Article.new
#   $article.title = "Test title"
#   $article.save # =>false
# See why it won't save
#   $article.errors.full_messages # =>"Description can't be blank"

# Validation works for description!

# Add a description and save
#   $article.description = "test description"
#   $article.save
#
# Now it saves

# What if we try to save Article with a 1 char title and description?
# That would go through since the fields aren't blank
# We can set a minimum character length so that we can get meaningful titles and descriptions

# In app/models/article.rb 
#   validates :title, presence: true, length: {minimum: 6, maximum: 100} <-- add length to line
#   validates :description, presence: true, length: {minimum: 10, maximum: 300} <-- add length to line
#
# Reload rails console and create a new article with a title and description that is too short
# Try to save then check error messages

# We can see that the length validation we just added works 










#=========================================================#
#            83. Instructor Notes: Validations            #
#=========================================================#

# You can view the code added for the validations to the article model here: https://github.com/udemyrailscourse/alpha-blog-6/commit/2efe9c071f85659bdb3e023871c55433d2a253bd

# Validations enforce constraints on your model so you can have greater control on what you are allowing as data to be saved in your database/tables.















#===================================================================#
#            84. Show articles (route, action, and view)            #
#===================================================================#

# Now we have a database that can hold articles and we are able to manipulate it
# Now let's try to make it something that a user can interact with on the site

# First we have to create a route to show an article 
# in config/routes.rb
# Add to bottom of do block:
#   resources :articles
#     This will give all the routes we need for articles
#     See routes available to articles with:(Rails console)
#       $rails routes --expanded
#         Doing this we can see there are quite a few routes available
# Now that all of these routes are available we are going to enable and make a method for the 'show' route
# We are also going to disable all other routes and enable them as we work with them
# 
# To do that add to 'resources' line above in routes.rb:
#   resources: articles, only: [:show]
#   
# Now only the show route will be available
# You can check in terminal with 
#   $rails routes --expanded
#     comparing this to what there was earlier all of the articles routes are gone except for show

# Now to display a page we have to see what id's we have in our development database (rails console)
#   $Article.all
# 
# There is an article with 1 in it so start rails server and follow the route to /articles/1
#
# We are getting a routing error "uninitialized constant ArticlesController"
# That's because we don't have an articles controller
# So let's build the articles controller

# Articles Controller
# In app/controllers/articles_controller.rb <-- Create file
#   class ArticlesController < ApplicationController
#   
#   end
#
# Notice this is the same format as the pages controller that we made
# Remember that the (<) means the ArticlesController is inheriting functions from the ApplicationController

# Save and reload the page
# Now we get "The action 'show' could not be found for ArticlesController"
# That means we have to make a show method in the ArticlesController to tell it what to do
# In the articles_controller we just made (inside the class) add:
#   def show
#   
#   end

# Save and reload the page
# Now we get error "ArticlesController#show is missing a template for request formats: text/html"
# That means it sees that there is a method but there is no view to call 
# So let's create a view

# Creating a view
# Create app/views/articles/show.html.erb <-- Create both articles folder and file show.html.erb
# add some h1 tags with a title like "Showing article details" to see if the view loads

# Now the page should be loading but it will be the same for each article and not show any of the details
# In order to show the correct details we have to retrieve the details from the database using the id we get from the user request

# How do we find an article based on an id?
# Normally in rails console we would use $article = Article.find(1)
# But we want to put that in our rails app
# In the articles_controller.rb: (inside show method since this is going to the show page)
#   @article = Article.find(params[:id])
#     
#     We need to use @article to make this an instance variable and available in the show.html.erb page
#       this allows us to use something like article.title in html to display the appropriate value
#     If we don't use the @ then it would be a regular variable only available in the show method
#     params
#       when receiving a request there will be a param hash that is sent containing information about that request
#       we can access the id that was requested from that by using [:id] (just like in an array or object)

# Let's use the data passed into the instance variable (by using the id from the request to get the appropriate article)
#  and display it in a view
# In app/views/articles/show.html.erb (below heading)
#  <p><strong>Title: </strong><% @article.title %></p>
#  <p><strong>Description: </strong><% @article.description %></p>
#
#   <% @variable.method %> indicates embedded ruby and the page should interpret that as ruby instead of html

# Why didn't this work?
# That's because our embedded ruby tag was wrong
# <% %> recognizes as ruby code but in order to display that code we have to use <%= %>
# add an equals to the to embedded ruby tags and it should work

# Now our article shows!

# Let's look at how we received the id in our controller in the params hash
# To do that we are going to use a tool called 'byebug'
# You can see that it is included in the app in the Gemfile
#   There is a comment that says to use the following to pause the server and get a debugger:
#     byebug
# This will pause your code wherever you put it and puts an output to the terminal where the server is running
# Typing "params" in the byebug debugger will show you the current parameters available
#   doing it on /articles/1 give us the following:
#     <ActionController::Parameters {"controller"=>"articles", "action"=>"show", "id"=>"1"} permitted: false>
# That's the object we got the id from in the articles_controller










#===========================================================#
#            85. Instructor Notes: Show Articles            #
#===========================================================#

# You can find all the code added for the show feature for our articles resource here: https://github.com/udemyrailscourse/alpha-blog-6/commit/7304bca894202f78535b4abdc870d42f6a254967

# Show actions are usually used to display individual items in a resource. For example:

# - a specific article from an articles table

# - a specific user's profile from a social media app

# - details of a specific stock from a stocks table

# - a specific recipe from a list of recipes

# The steps are to -

# 1) Have a route for it

# 2) Have the corresponding controller/action that the route directs the request to

# 3) Have a corresponding view to display to the user who makes the request

# The code details for each step are in the link provided at the beginning of this text resource. As a reminder: the red highlighted area are removals and the green highlighted area are additions.















#==========================================#
#            86. Articles Index            #
#==========================================#

# Now we can view individual articles
# Let's make an articles index where we can view a list of all articles
# It will be on the /articles page in the browser

# First we have to define a route that will lead to the articles controller #index action
# Then articles_controller will request data from the model
# The model will get the data from the database, send it back to the controller
# Then the controller will pass the data to the view to be displayed
#   we will get a list of articles and iterate through them to display them all

# Let's start with defining the route in routes.rb
# First take out the "only: [:show]" for articles resource so we have access to the other routes for a minute
# In terminal let's look at what the index route looks like ($rails routes)
#   Prefix            | articles
#   Verb              | GET
#   URI               | /articles(.:format)
#   Controller#Action | articles#index
#
# Now that we know the action we can re-add the "only: [:show]" in routes.rb and include :index
# Should now read:
#   resources :articles, only [:show, :index]
#
# Now rails will expect an index action in the articles_controller before we are able to use it
# In articles_controller.rb:
#   def index
#
#   end

# Now Rails will expect an articles/index.html.erb in views <-- Create file
# Add a heading:
#   <h1>Articles Listing Page</h1>

# Now the page loads but we still have to populate it with articles
# Let's build out the index method in the articles_controller
# How should we do this?
# We want to take the full list of articles like in the rails console:
#   $articles = Articles.all
# Now articles is a list of all the articles in the table
# Then we can take each entry in that list and add a row to an html table with that entries information
# 
# In articles_controller.rb (in index method)
#   @articles = Article.all
#
# Now the @articles instance variable will have all the articles in the articles table

# Now onto the view!
# We want to display a table that displays a title, description, and actions as we add them
# Let's get the table started
#   <table>
#       <thead>
#           <tr>
#           <th>Title</th>
#           <th>Description</th>
#           <th>Actions</th>
#           </tr>
#       </thead>
#       <tbody>
#       <% @articles.each do |article| %>
#           <tr>
#               <td><%= article.title %></td>
#               <td><%= article.description  %></td>
#               <td>Place holder</td>
#           </tr>
#       <% end %>
#       </tbody>
#   </table>
# 
# What is happening?
# First at the top of the table we are using normal html to set some table headings
# Then in the body of the table there is a do block that loops through the list of articles
# For each of the articles it creates a new row
# It fills one column of the row with the title, one with the description, and one with a placeholder text
# Then it moves onto the next article in the @articles variable (holding Article.all) and creates a new row for it repeating the process










#============================================================#
#            87. Instructor Notes: Articles Index            #
#============================================================#

# The code added in the video to build this articles listing feature can be found here: https://github.com/udemyrailscourse/alpha-blog-6/commit/71c5d3866d77b3add9829af8c8d30f027a46e070

# The index action in a controller is used to display a summarized listing of all the items in a table. If there are big blog posts as each item, then the index would usually contain either a summary of the post or a few hundred characters that link to the actual post.

# Examples:

# - articles listing

# - users listing

# - friends listing

# - stocks listing

# - photos listing

# - listing of people you are following on IG etc.

# All the code added to build this - route, controller/action, view template is provided in the link at the beginning of this text resource.















#=====================================================================#
#            88. Forms - Build a New Article Creation Form            #
#=====================================================================#

# Now we are going to add the ability to create new articles to the front end
# the path will look like /articles/new

# The form we make will submit to /articles with a post request
# When using inspect element you will see authenticity token
#   rails uses this to verify that the form came from a valid source
#    (not someone trying to put in bad data)

# We are going to need the new and create routes in routes.rb 
# Do this by adding to the 'only' method for resources :articles
# Line should now read:
#   resources :articles, only: [:show, :index, :new, :create]
# 
# Now that these routes are available in our application we can view them with $rails routes --expanded
#   new
#     Prefix            | new_article
#     Verb              | GET
#     URI               | /articles/new(.:format)
#     Controller#Action | articles#new
#
#   create
#     Prefix            |
#     Verb              | POST
#     URI               | /articles(.:format)
#     Controller#Action | articles#create

# Let's build these two options in the articles_controller.rb
# Add 2 new methods to the ArticlesController
#   def new
#   
#   end
#   
#   def create
#   
#   end

# Now we need to create a 'new' view
# create app/views/articles/new.html.erb <-- Create this file
# Add a simple heading so we can see that the page loads

# We should be able to load the new page
# Let's add the form
# We are going to use Action View Form Helpers
#   more info: https://guides.rubyonrails.org/form_helpers.html
# We are going to use the 'form with' helper'
#   One thing to note is that it submits using ajax
#   We are going to modify it so it submits using a regular http post request

# In app/views/articles/new.html.erb:
#   <%= form_with scope: :article, url: articles_path, local: true do |f| %>
#     <p>
#         <%= f.label :title %> <br/>
#         <%= f.text_field :title %>
#     </p>
#     <p>
#         <%= f.label :description  %> <br>
#         <%= f.text_area :description %>
#     </p>
#     <p>
#         <%= f.submit %>
#     </p>
#   <% end %>
#
# What's going on?
# We are createing a form and setting the place it is submitting to to the articles table
# We specify the url as articles_path (available route from rails)
# local: true is to submit using http post request instead of ajax for simplicity
# Then we start a do with f as an arguement
#   f is an object containing available methods built into form_with
#
# We start a paragraph to hold title information
# first line is saying this is a label called title (gotten from articles table?)
# second is saying this is the text field and the data entered here should be submitted as a title attribute
#
# We start another paragraph to hold description information
# first line is saying this is a label called description (gotten from articles table?)
# second line is saying this is a text area and the data entered here should be submitted as a description attribute
#
# Then there is a submit button provided by form_with
# It will submit the data with our articles#create method
# This method exists but doesn't do anything so we have to go set it up in the articles_controller

# First if you want to see the data that is submitted here
# Use the following in article_controller create method since that's where the submission button leads
#   render plain: params[:article]
#
# This will load the article object of the hashed parameters (similar to how we handled id in the previous lesson)










#======================================================================#
#            89. Instructor Notes: Forms - New Article Form            #
#======================================================================#

# To create a new article from the browser (front-end), you'll need a form to get input from the user. Since we're dealing with articles which have title and description, you want to give the user an ability to fill-in the title and description of the article they are trying to create. The form is displayed via the new route/action and the form submission is handled by the create action.

# First you'll need to expose these two routes in the config/routes.rb file, so the file looks like below:

# Rails.application.routes.draw do   root 'pages#home'   get 'about', to: 'pages#about'   resources :articles, only: [:show, :index, :new, :create] end

# You will need to add the new and create actions in the articles_controller.rb file like below:

# def new
# end

# def create 
# end  
# You will also need to create a view template for the new view. So, in the app/views/articles folder create a new file called new.html.erb and fill it in like below:

# <h1>Create a new article</h1>

# <%= form_with scope: :article, url: articles_path, local: true do |f| %>
#   <p> 
#     <%= f.label :title %><br/> 
#     <%= f.text_field :title %>
#   </p>
#   <p>
#     <%= f.label :description %><br/> 
#     <%= f.text_area :description %> 
#   </p>
#   <p>
#     <%= f.submit %> 
#   </p>
# <% end %>















#======================================================================#
#            90. Create Action - Sae Newly Created Articles            #
#======================================================================#

# Now that we can get details of an article from a user we have to create a new method
# This method will save the details as an entry in the database

# Right now when hitting submit the articles#create function is ran but it doesn't do anything
# That means the data that was entered is never getting submitted to the database

# Think of how we would do this in rails console:
#   $article = Article.new(title: "some title", description: "Some description")

# In articles_controller.rb (in create method) we can do something very similar
# The difference is we will use the data from the params (article gets added to params when user submits data) 
#
#   def create
#     @article = Article.new(params.require(:article).permit(:title, :description))
#   end
#
# As a security feature of rails we have to whitelist the values that can be added when creating new databse entries
#   .require adds :article (the object just made by the user) as an available object in the method
#   .permits specifies which attributes of that object can be submitted
#    (otherwise it would not submit correctly and return an error)
#
# Now we can see that we are able to access the article object in the method by (below the line we just added):
#   render plain: @article
#
# Save and run submit now and the browser will display the article object
#   =>#<Article:0x00007f913859f350>

# Now when submitting we can see that there is an article object but it hasn't been saved yet
# How do we save in rails console?
#   $article.save
# Same process here but with @article below the line we just wrote
# The added section should now read: (remove render plain: @article)
#   def create
#     @article = Article.new(params.require(:article).permit(:title, :description))
#     @article.save
#   end

# Save and try creating a new article in the browser
# When we click submit nothing happens?
# But we can go back to /articles and see the new entry so it worked!

# Nothing happens after we click save because we didn't tell rails to do anything else
# We can have it load a new page after we submit to make the app flow better
# Let's make the page go to the created article's show page

# To redirect to the created article show page
# in the create method we have been chaging: (add to bottom of method after save)
#   redirect_to article_path(@article)
#   # This can also be shortened to: redirect_to @article and rails will know what to do since it is so common
#
# What rails will do is take the id of the instance variable article (the one just created)
#  and use it to construct the article path (which shows individual articles remember when building the article view?)
#
# Now when submit is clicked it will redirect to it's show page after submitting

# There is still 1 issue
# If we try to submit an article with /articles/new with a blank title/description it will not submit the article (good, our validation is working)
#  but it doesn't tell you there is a problem and opens the /articles list
# 
# We want to add some kind of error message so a user knows why what they submitted was not accepted










#===============================================================================#
#            91. Instructor Notes: Create Action - Save New Articles            #
#===============================================================================#

# The create action is used to handle the form submission from the new article creation form. The code added for the entire new article creation process to this point can be found here:

# https://github.com/udemyrailscourse/alpha-blog-6/commit/931d7f3f1287b99084d9d0a49bd45fc5c9ba43eb

# Things to keep in mind: Strong parameters - whitelisting of data (values associated with attributes) that are received through the params hash. During this process for articles you had to 'whitelist' the data coming through for the title and description fields.















#=====================================================================#
#            92. Messaging - validation and Flash Messages            #
#=====================================================================#

# In the last video we were able to submit new articles
# However it only works for articles that pass validation
# If an article doesn't pass validation no data is saved (which is good)
# But the user doesn't get any notication that nothing was saved or kno why it wasn't
#
# We are going to add a new feature which will show a message when an article is submitted
# The message will say whether saving the article was successful or not
# If it is unsuccessful it will say why it failed 

# First we are going to start with the error messages
# We are saving the articles in the create method of the articles_controller
# We want to show the error IF @article.save fails so let's put it in an if block
# In app/controllers/articles_controller: (create method)
#   if @article.save
#     redirect_to @article
#   else
#     render 'new'
#   end
#
# What does this do?
# This will check if the @article.save action was successful (true or false)
# If it is successful then redirect to the new article
# If it is not successful render the articles/new page

# Now we have to edit the new.html.erb file to display any error messages
# We are going to add these error messages above the form that the user fills
#  to make it easier to see
# How do we check for errors in the console?
#   $article.errors.full_messages
# We want to do something similar our 'new' view
# in app/views/articles/new.html.erb: (above form) 
#   <% if @article.errors.any? %>
#     <h2>The following errors prevented the article from being saved</h2>
#       <ul>
#         <% @article.errors.full_messages.each do |msg| %>
#           <li><%= msg %></li>
#         <% end %>
#       </ul>
#   <% end %>
#
# What does this do?
# This checks if the @articles instance variables has any errors attached to it
# If it does:
#   It displays a heading
#   Creates a list
#   Adds an item to the list for each error (item says what the error is)
#
# We still have a problem
# When loading the page @articles doesn't exist since it isn't created until submit is pressed
# We have to go back to the articles_controller and initiate @articles when the articles/new page is loaded
# In articles_controller.rb: (in new method)
#   @article = Article.new

# Now when we try to save an invalid article in our website it will show the errors above the form in a list

# When the article does save we want to show a message showing that the action was successful
# We are going to use a rails helper called flash
# Rails provides this to allows us to provide users with information or messages
#
# In article_controller.rb: (in if @article.save loop of create method)
#   flash[:notice] = "Article was saved successfully"
#
# What does this do?
# Flash is used to send messages to the user :notice is a key that flash offers
#   :alert is the other key flash offers but is usually used for errors
# Now we can use this message when rendering the article

# Now to display this message
# We are going to display this in the main layout file since it is shared with all of our views
#  then if we decide that we want to redirect to somewhere else in the future we won't have to worry about the message not showing
# This also allows us to display other flash messages on from other pages for different reasons if we need to
#
# In app/views/layouts/application.html.erb: (after start of body tag, before yield tag)
#    <body>
#     <% flash.each do |name, msg| %>
#       <li><%= msg %></li>
#     <% end %>
#     <%= yield %>
#   </body>

# Now after saving an article there is a small message if the save is successful!










#======================================================================================#
#            93. Instructor Notes: Messaging - Validation and Flash Message            #
#======================================================================================#

# All the code updates made in the video can be found here: https://github.com/udemyrailscourse/alpha-blog-6/commit/83360929b5b1feb45491ecb7c9f8aa9285ab0c64

# In order to display the validation messages, we have to add an if else block to our create action. This is done to check for if the save happened, if not (else clause) then we display the new form again with the messages displayed. The create action would look like below:

# def create
#   @article = Article.new(params.require(:article).permit(:title, :description))
#   if @article.save
#     redirect_to @article 
#   else
#     render 'new'
#   end
# end
# In order to display the messages, we add the following code block to the new.html.erb template (above the form code):

# <% if @article.errors.any? %> 
#   <h2>The following errors prevented the article from being saved</h2> 
#   <ul> 
#     <% @article.errors.full_messages.each do |msg| %> 
#       <li><%= msg %></li> 
#     <% end %> 
#   </ul>
# <% end %>
# To make the code work for the first time when the new form is displayed, we have to initiate an @article instance variable in the new action of the articles controller. Otherwise, the code @article.errors.any? will fail (as there is no @article instance variable available at the time).

# Therefore, update the new action like below:

# def new
#   @article = Article.new
# end
# To display messages to the user using the flash messages helper, update the create action with the additional flash line like below:

# def create
#   @article = Article.new(params.require(:article).permit(:title, :description))
#   if @article.save
#     flash[:notice] = "Article was created successfully."
#     redirect_to @article 
#   else
#     render 'new'
#   end
# end
# Once the flash helper has the key of 'notice' which has value of 'Article was created successfully' via the create action, you can use this helper in your views (upon the redirect) to display the message to the user. Therefore we add the following code to the app/views/layouts/application.html.erb file within the body tag:

# <% flash.each do |name, msg| %> 
#   <%= msg %> 
# <% end %>















#===================================================================#
#            94. Edit & Update: Update Existing Articles            #
#===================================================================#

# Now that we can add new articles, let's add the ability to edit/update them
# We will use a combination of the edit and update methods in the articles controller
#   edit
#     will help find the article and display the form
#   update
#     will work behind the scenes to update the database with the new values

# To use these to methods we will need to permit the edit and update routes in routes.rb
# in routes.rb:
#   resources :articles, only: [:show, :index, :new, :create, :edit, :update] <-- Add edit and update to the list

# Now we have edit and update available in our rails routes
# Get the info on these routes with $rails routes --expanded
# 
#   edit
#     Prefix            | edit_article
#     Verb              | GET
#     URI               | /articles/:id/edit(.:format)
#     Controller#Action | articles#edit
#
#   update
#     Prefix            |
#     Verb              | PATCH
#     URI               | /articles/:id(.:format)
#     Controller#Action | articles#update
#     --------------------------------------------------
#     Prefix            |
#     Verb              | PUT
#     URI               | /articles/:id(.:format)
#     Controller#Action | articles#update
#
# Notice that update has both PATCH and PUT for verbs
# Currently PATCH is the standard for what should be used

# If we try to visit /articles/1/edit we cannot edit an article because we do not have an edit method in the articles_controller
# So let's create articles#edit and articles#update

# first let's get the edit method ready
#   in articles_controller add new method:
#     def edit
#   
#     end

# Now create update method 
#   in articles_controller add new method:
#     def update
#
#     end

# create a new articles view edit.html.erb
# copy/paste all the content from new.html.erb into this new file
# This is because we want to use the same form
# We will update this to use as a layout and be plugged into multiple places later
# in edit.html.erb:
#   <h1>Edit Article</h1>
#   <% if @article.errors.any? %>
#     <h2>The following errors prevented the article from being saved</h2>
#     <ul>
#       <% @article.errors.full_messages.each do |msg| %>
#         <li><%= msg %></li>
#       <% end %>
#     </ul>
#   <% end %>
#
#   <%= form_with(model: @article, local: true)  do |f| %>
#     <p>
#       <%= f.label :title %> <br/>
#       <%= f.text_field :title %>
#     </p>
#     <p>
#       <%= f.label :description  %> <br>
#       <%= f.text_area :description %>
#     </p>
#     <p>
#       <%= f.submit %>
#     </p>
#   <% end %>
#
# What does all of this do?
#   The heading has been changed from new.html.erb
#   The if block for errors is still the same
#   The form_with has been changed to use @article (current article being edited) as the model
#   rails is smart enough to auto fill the fields based on :title and :description entry fields in the form

# Now we have to initiate an @articles variable since edit has not been told which article to use yet
# We can do this similar to how we made the show method work
# In the edit method that we made a few steps back:
#   @article = Article.find(params[:id])
#
# What does this do?
# This will take the parameter of the article passed into the url (:id) and allow us to use it to find the appropriate article
# Then we assign that article to an instance variable and are able to pass it to the edit.html.erb page

# Now we have to fix the submit button
# Currently it will try to run the articles#update function (form_with is smart enough to realize this is on existing object
#  since we used it as the model so instead of running a articles#create it runs articles#update)
# We do have an articles#update method but the method is empty and tries to look for update.html.erb
# Instead we want to fill in the method with our update functions
# In the update function we created a few steps back:
#   def update
#   @article = Article.find(params[:id])
#   if @article.update(params.require(:article).permit(:title, :description))
#     flash[:notice] = "Article was updated successfully"
#     redirect_to @article
#   else
#     render 'edit'
#   end
#   end
#
# What does this do?
# When the submit button is pressed on the edit page the articles#update method will be run
# The app will find the current article based on the params in the url and assign it to the @articles instance variable
# Then the app will attempt to save it to the database (similar to articles#new we have to whitelist the allowed params 
#  so people don't edit things they aren't supposed to)
# If it is successful in updating:
#   There is a flash notice similar to in articles#new saying it was successful
#   Page redirects to the updated articles#show page
# If it is not successful in updating:
#   the 'edit' page will re-render with error messages similar to articles#new










#===========================================================#
#            95. Instructor Notes: Edit & Update            #
#===========================================================#

# The process of editing an existing article and updating the article in the articles table utilizes the edit and update actions. The standard process is as follows:

# 1. Expose edit and update routes.

# 2. Add edit and and update actions in the articles controller.

# 3. Create an edit template (form) in the app/views/articles folder.

# 4. Use the edit action to find the article to edit, display the existing article details in the edit form.

# 5. Use the update action to find the article in the db. Whitelist the new title and description fields and if there are no validation errors, then update the article in the articles table with the new data.

# The completed code added in the video for the entire process can be found here: https://github.com/udemyrailscourse/alpha-blog-6/commit/a7b9797b08dbc7fc5272f459b3659b9df289e354















#====================================================#
#            86. Delete - Delete Articles            #
#====================================================#

# The last CRUD action we have to do for our articles is to delete
# First we need to expose the destroy route
# We could do the following to add the routes in routes.rb
#   resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy] <--added destroy to end
# 
# But then all of our :articles routes are exposed and makes the only statement redundant
# So instead we can just get rid of the only statement
# Now the line should read:
#   resources :articles
# 
# This also exposes all of our restful routes
# This stands for Representational State Trasnsfer
# It is basically a mapping of http verbs
#   It maps the HTTP verbs (get, post, put/patch, delete) to CRUD actions

# Now that we have access to all the restful resources let's add our destroy action
# We can see our new destroy routes ($rails routes --expanded)
#   destroy
#     Prefix            |
#     Verb              | DELETE
#     URI               | /articles/:id(.:format)
#     Controller#Action | articles#destroy

# We can see that we will need a destroy method in the articles controller so let's add that first
# In articles_controller.rb: (Create a new method)
#   def destroy
#     @article = Article.find(params[:id])
#     @article.destroy
#     redirect_to article_path
#   end
#
# What does this do?
# This creates a destroy method
# sets the instance variable of article to be the one selected (selected article id will be in parameters)
# destroys the selected article
# redirects to /articles full list of articles

# Now we have the destroy action but how do we pass in the id to params?
# We can link that in the view
# In the articles listing page each article can get a delete button and that button will pass the appropriate id
# That id would be used to delete the appropriate article
# The page would then "refresh" (since we are viewing /articles and we are rerouted to /articles) to show the article removed

# To add the link to active the delete function
# In app/views/articles/index.html.erb: (The articles listing page) (Replace "placeholder")
#    <% @articles.each do |article| %>
#     <tr>
#     <td><%= article.title %></td>
#     <td><%= article.description  %></td>
#     <><%= link_to 'Delete', '#' %></td> <-- Line to change
#     </tr>
#     <% end %>
# 
# What does this do?
# This adds a link next to each article in the listing that shows the word delete
# We haven't added the link to the individual article yet though
# The second arguement is the path to link to and we only have '#' so our link would be /articles/#
# We still have to get the current article id and replace the # with that

# Add link to article
# To add the link we have to modify the link where the # symbol was
# We can utilize the same method we did to trigger the show method
#   <td><%= link_to 'Delete', article_path(article), method: :delete %></td>
#
# What does this do?
# link to is taking 3 arguements
#   arguement 1 text to display
#     We have the link displaying "Delete"
# 
#   arguement 2 where the link should go
#     By using article_path(article) we are saying the path to this individual article
#     we know what that individual article's id is because this is in a do loop that is
#      handling an individual article
#    
#   arguement 3 a method
#     here we are specifying the delete method
#     it must use the http verb (listed with $rails routes) which will trigger our destroy method

# Now we are able to delete articles from the articles index page!

# We can also add other paths while we are at it like show
# Let's add that line in index.html.erb above the delete link we made so it shows first
#   <td><%= link_to 'Show', article_path(article) %></td>
#
# This is the same as the one we used for delete without calling the delete method










#=============================================================#
#            97. Instructor Notes: Delete Articles            #
#=============================================================#

# Deleting articles can be accomplished using the destroy action in the articles controller. The standard deletion process would look like below:

# 1. Expose the destroy route.

# 2. Add the destroy action in the articles controller.

# 3. Find the article to delete and delete it using the destroy method within the destroy action.

# All the code added in the video for the destroy action can be found here: https://github.com/udemyrailscourse/alpha-blog-6/commit/a1634510396abc38d049ba04e84368a397efe5ab

# Please review the video if you want to learn more about the completion of all the REST routes for our articles resource.















#=============================================================#
#            98. User Interface - Add Layout Links            #
#=============================================================#

# We added the show and delete links to /articles page 
# Let's add the edit page

# We can add that after the 'Show' line in the articles/index.html.erb
# Similar to the show and delete lines:
#   <td><%= link_to 'Edit', edit_article_path(article) %></td>
# The only differences are what gets shown (first link_to arguement) and the article_path
# We can use edit_article_path just like article_path because you can see the prefix in railes routes is edit_article

# Now we have three actions but notice that the "Actions" column header is offset and only covering 1 column
# We can adjust it to cover three with in-line css 
# Change the <th>Actions</th> tag to <th colspan="3">Actions</th> to make it span all 3 columns

# Next we want to add a link to create a new article
# Underneath the table let's add a link tag
#   <%= link_to 'Create New Article', new_article_path %>

# Now let's work on the show page
# When looking at an individual article what kind of actions do we want?
#   The ability to edit
#   The ability to delete
#   The ability to navigate back to articles index
# 
# We can do all three in the show.html.erb (end of file so it is below article data) (add pipe after each for seperation)
#   edit
#     <%= link_to 'Edit', edit_article_path(@article) %> |
#
#   delete
#     <%= link_to 'Delete', article_path(@article), method: :delete %>  |
#
#   articles index
#     <%= link_to 'Return to Articles Listing', articles_path %>
#
# Notice these are all the exact same as we have used elsewhere (like in the buttons on article index)

# We don't want people deleting articles on accident so we are going to make a pop up to confirm delete
# We can do this with js
# at the end of our link_to delete ruby code above add after method: :delete (don't forget to seperate them with commas)
#   data: { confirm: "Are you sure?"}
#   
# Go ahead and add this to the delete button on articles index page as well

# Now for Create a new article
# Let's add an option to return to the articles listing
# Copy and paste the return to article index block from above to the Create a new article page
#
# Let's do the same thing for the edit page now

# Let's add a link to the articles index on the root (home) page of our application
# In app/views/pages/home.index.erb paste the code that routes to /articles (change link text)
#    <%= link_to 'Articles Listing', articles_path %>
# We can also add a link to the about page here
#      <%= link_to 'About Page', about_path %>

# Let's also update the about page to include a link to the home page
#   <%= link_to 'Return Home', root_path %>










#==========================================================#
#            99. Instructor Notes: Layout Links            #
#==========================================================# 

# We added a lot of links to the application in order to perform all the actions for articles, 
# along with adding the ability to navigate around the application. 
# These were accomplished using layout links. 
# All code changes/additions made during the video to cleanup the look of the application can be found here: 
#   https://github.com/udemyrailscourse/alpha-blog-6/commit/cf48891f1561626d5c3d64e5ef6e56da3ab66fc7















#========================================================#
#            100. DRY (Don't Repeat Yourself)            #
#========================================================#

# Notice that there are quite a few places where we copy/pasted code
# a particularly bad example is our new and edit pages
#  they are almost exactly the same

# When programming we should try to re-use as many methods and as much code as possible
# That way if something needs changed (like the layout of our article submission form)
#  we only have to change it in one place

# We are going to re-factor and extract away redundancies

# First let's start with the articles_controller
# One line that pops up a lot is the following:
#   @article = Article.find(params[:id])
#
# It is listed in the show, edit, update, and delete methods

# We are going to copy that line and move it into a new method with just that line
# Then anywhere that line appears in articles_controller we will replace it with the method 
# first below all other methods simply write private by itself on its own line
#   private
#
# This will make any methods below it private and only accessible by another method in the articles controller
# Now let's place our new method below the private line to create a private method
#   def set_article
#     @article = Article.find(params[:id])
#   end
#
# Now we can erase that line from the four methods it was in

# How do we call this method for these actions now?
# At the top of the class (before any methods)
#   before_action :set_article
#
# What does this do?
# This is a ruby helper that receives our method name (as a symbol)
# It will perform this method before any of the other methods are run
# But we only want to do this for the 4 methods we removed the line from
#
# We can use the only: tag again (remember when we only allowed certain routes before allowing them all?)
# Update the line: (at the top of the class before any methods)

# Let's find any other repetative lines
# Notice in the create method when we assign the instance variable
# We use the same line in the update method
# For both methods we have to whitelist an article submission with this line:
#   @article = Article.new(params.require(:article).permit(:title, :description))
#
# Make another private method called article params: (Below private line)
#   def article_params
#     params.require(:article).permit(:title, :description)
#   end
#
# Then in create and update methods replace "params.require(:article).permit(:title, :description)" with article_params

# Now let's move onto the views
# The new and edit pages have almost identical code so let's try to make 1 form/page that gets loaded for both views
# We can do this with a partial
# This works by taking redundant code between 2 files, putting it in a third file, and calling that file where you need it

# To start with something simple let's make a partial for our flash messages
# Remove the 3 lines from the flash.each block in application.html.erb (the three below)
#   <% flash.each do |name, msg| %>
#     <li><%= msg %></li>
#   <% end %>
#
# We are going to paste this into a new file

# To create a partial:
# Under app/views/layouts create a new file _messages.html.erb
#   Partials always start with an underscore for rails to recognize it as a partial
# Then simply paste in those 3 lines and save the partial
# Now we just have to render the partial
# To do that go back to the application.html.erb
# Above the <%= yield %> tag (where the flash messages lines were before):
#   <%= render 'layouts/messages' %>
#
# We just have to use render and specify where the partial is
# Rails will automatically know it is a partial so we do not put the underscore

# Now that we have had some practice creating a partial let's do the same for the new and edit forms
# Create a partial called forms in the articles folder (same folder as the edit and new pages)
#   app/views/articles/_form.html.erb
# 
# We will use the code from the edit template
# This is because we have a different format in the edit template
# The code that is in edit will work for both new and edit but the code that is in new will only work for new
# Copy both the error code and the form code since we will need them both and we will always want to display that error with a form submission
# Cut code:
#   <% if @article.errors.any? %>
#     <h2>The following errors prevented the article from being saved</h2>
#     <ul>
#       <% @article.errors.full_messages.each do |msg| %>
#         <li><%= msg %></li>
#       <% end %>
#     </ul>
#   <% end %>
#
#   <%= form_with(model: @article, local: true)  do |f| %>
#     <p>
#       <%= f.label :title %> <br/>
#       <%= f.text_field :title %>
#     </p>
#     <p>
#       <%= f.label :description  %> <br>
#       <%= f.text_area :description %>
#     </p>
#     <p>
#       <%= f.submit %>
#     </p>
#   <% end %>
#
# Paste the above into the newly created _form.html.erb

# Now nothing will show up in edit template until we call the partial
# In edit.html.erb:
#    <%= render 'form' %>
# 
# This is slightly different than when we did it in the application.html.erb because we had to specify the layout folder there
# We do not have to specify the folder here because it is the same one and application.html.erb is a special case

# We also have to remove the error messages and form from new and add the same render tag










#=======================================================#
#            101. Instructor Notes: DRY Code            #
#=======================================================#

# DRY - Don't Repeat Yourself - code can be accomplished by refactoring or 'extracting away code redundancies'. We accomplished a significant amount of this by using a couple of private methods in our articles controller and using partials in our views. Clean code should always be a priority once features are built and working as we want so that our code is easy to read and easily maintainable. All changes we made to the application during the video can be found here:

# https://github.com/udemyrailscourse/alpha-blog-6/commit/b36fdad0dfb852d07c59b0c7b04e810cd13778e0










#==========================================================#
#            102. Production Deploy and Wrap Up            #
#==========================================================#

# Now at the end of the section is a good time to push our code to production

# First step is to check the gemfile
#   $bundle install --without production
#
# This is important to run before any production push because it will sync any updates to the gem file

# Make any commits needed

# Push to git account first (don't have to but we will)

# Now to deploy to heroku
#   $git push heroku master
#
# This will probably take a couple of minutes

# There is one more step that we have to do this time
# This is because the production environment is different from the local environment
# The local databse and data in it has not been pushed to production but the migration files have

# What we need to do is run the migration files in the production environment 
# This will create a production databse for our application
# To do that:
#   $heroku run rails db:migrate

# Now the site should be ready to visit on heroku










#====================================================================#
#            103. Instructor Notes: Prod Deploy & Wrap Up            #
#====================================================================#

# We used the following steps to deploy our application to production (using Heroku). 
# If you have not set up a Heroku account and deployed the application at the end of section 3 
# (including all the setup steps like installing Heroku CLI and creating a heroku app), 
# you are encouraged to do so now before moving forward. 
# If you would rather not deploy to production, then you can safely skip this step.

#   Steps we followed:
  
#   - verify Gemfile
  
#   - issue the following command in the terminal bundle install --without production
  
#   - make a commit of code
  
#   -- git add -A
  
#   -- git commit -m "helpful message depending on what you are committing to your repo"
  
#   To deploy to heroku:
  
#   git push heroku master
  
#   To push to GitHub repo:
  
#   git push origin master
  
#   Since we now have a db component to our application with the articles table, 
#   we will need to run migrations in production so the production articles table is created. 
#   To run migrations at heroku, you can use the following command:
  
#   heroku run rails db:migrate
  
#   You can preview your production app by issuing the following command from the terminal:
  
#   heroku open
  
#   or,
  
#   You can directly pull up a browser window and paste in the name of your application. It'll take the following format:
  
#   https://yourappname.herokuapp.com
  
#   Congratulations on completing Section 4, well done!















#=========================================================================#
#            Excercise 3. Define a style to set the font color            #
#=========================================================================#

# The code shown below in the file inedex.html is a simple html page with a <p> tag in the body
# Create a style in the stylesheet file (style.css) to set the font color for all <p> elemets to red

# style.css
#   p {
#     color:red;
#   }










#========================================================================#
#            Excercise 4. Define a style to remove underlines            #
#========================================================================#

# The HTML file, index,html, shown below contains a simple page with a hyperlink. 
# By default, hyperlinks are decorated with an underline. 
# You have to define a style for hyperlinks in the stylesheet file (style.css)
# to remove this decoration (The underline) from hyperlinks

# style.css
#   a:link{
#     text-decoration: none;
#   }










#============================================#
#             SECTION 4 COMPLETE!            #
#============================================#