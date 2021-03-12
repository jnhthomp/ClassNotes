#=============================================================#
#       54. Intro to Section 3 and Ruby on Rails Kickoff      #
#=============================================================#
# Ruby on Rails kickoff - Text directions and references
# Rails overview:

# https://guides.rubyonrails.org/

# https://rubyonrails.org/

# https://weblog.rubyonrails.org/

# Creator of Rails: David Heinemeier Hansson

# https://dhh.dk/

# Ruby meetups:

# https://www.meetup.com/topics/ruby/

# Online code repository hosting services:

# https://github.com/

# https://bitbucket.org/

# Devise gem GitHub repository:

# https://github.com/heartcombo/devise

# Gems for Ruby and Ruby on Rails:

# https://rubygems.org/




#================================================================#
#       56. Model, View, Controller and Rails App Structure      #
#================================================================#

# Rails uses a Model View Controller (MVC) organization
# Seperates back end and front end functions

    # Model 
        # Resources that will be used by the application
        # Data that will be used to drive the site

    # View
        # Front end of the application
        # What the user sees in the browser/mobile device
        # Usually HTML, CSS, and JavaScript
            # In RoR HTML files have a .erb extension so ruby can use them


    # Controller
        # "Brains behind the application"
        #  Handles and routes user requests in the application
        #  Middle man to handle communciation between Models and Views


#==============================#
#       58. Teacher Notes      #
#==============================#

# Model, View, Controller and Rails App Structure - Text references
# MVC - Model, View, Controller

# General flow of Rails application:

# -> Request made at browser

# -> Request received at router of rails application

# -> Request routed to appropriate action in a controller

# -> Controller#action either renders a view template or communicates with model

# -> Model communicates with database

# -> Model sends back information to controller

# -> Controller renders viewg





#=======================================================================#
#       60. Root Route, Controller, More MVC and Say "Hello World"      #
#=======================================================================#

# Root route is simply the url that is used to access a site
# For local ruby apps it will be localhost:3000
# For other sites it would be google.com or facebook.com

# to change root route we must capture the route and send it somewhere
# to do so we need to work in the 'config/routes.rb' file of the application

# in that file 
    # to add a root route
    # When adding controllers with root route you only have to specify the first part of the name of the file
    # Rails will assume the path and that it ends in _controller.rb
    # This tells rails to expect a "hello" method in the application controller
        # root 'application#hello'

# The hello method must be defined in controllers/application_controller.rb (or whatever root route was added)
# It must render a template in order to work
    # render html: 'Hello World!'



# Generate a View
# Conventional Expectations
    
    # Define a route that points to a controller#action
    
    # Have an appropriately named controller
        # ex if a dealing with layouts or static pages a name could be pages_controller
    
    # Have an appropriately named action
        # ex if dealing with a homepage the action/method could be called 'home'

    # If done this way, under views, rails will expect a pages folder (named for the pages controller) and a home.html.erb template (named for the home action)




#===============================#
#       61. Teacher Notes:      #
#===============================#

# Root route, controller and more MVC - Text directions and references
# To set a root route, navigate to config/routes.rb file and enter in the following code ->

# root 'pages#home'

# In order to preview the application, you will need to start the rails server. You can start the server by navigating to the terminal and typing in the following command from your application directory followed by enter/return:

# rails server

# You can also type rails s for short. Once the server starts you can open up a browser window and type in localhost:3000 to preview the app. If you are using AWS cloud9, please use the videos in section 14 where previewing the applications are covered (after creating new rails apps using rails 5 and 6) since the preview link differs (it won't be localhost:3000).

# Back to the app, in order for the code to work there will need to be a pages controller and a home action within it.

# Create a pages controller by navigating to the terminal/command line and typing in the following command from your application directory:

# rails generate controller pages

# There should now be a pages_controller.rb file under app/controllers folder.

# Open up this file and add the home action to it with a rendering of 'Hello World!' like below:

# def home
#   render html: 'Hello World!'
# end
# Once you save this file and reload the browser preview, Hello World! should be displayed in the browser.

# In order to do this the conventional way using views remove the code within the home action and leave it as an empty method/action like below:

# def home
# end
# This will expect a home.html.erb template under the pages folder under views. This pages folder under the views folder was created when the pages controller was generated.

# Within this app/views/pages folder, create a new file called home.html.erb and add in the following code inside the file:

# Hello World!

# Once you save this file and preview it from the browser, it should still say Hello World! as expected.

# Congratulations, you have made your Rails application say 'Hello World!'



#=================================================#
#       62. Structure of a Rails Application      #
#=================================================#

# structure of a rails application

# app
    # assets - Stores static asset such as images and style sheets (images for layout, not images users will be using)
        # stylesheets - stores all css files
            # application.css - manifest file that makes all style sheets available to all views in application (you can see this linked in the application.html.erb file in ./views/layouts)
        # channels/application _cable - makes real time communications available in rails applications
        # controllers - houses ruby conrollers (see c of mvc model)
            # application_controller.rb - all functionalities available to application controller will be available by default to all other controllers
        # helpers - holds helper functions or methods used in view templates. ONLY USED TO HELP WITH VIEWS
        # javascript (in rails < 6 this is in assets folder)
            # packs 
                # application.js - main js file and makes js available for use in application (you can see this linked in the application.html.erb file in ../../views/layouts)
        # models - stores models (see m of mvc model)
            # application_record.rb - all functionalities available to application record will be available by default to all other controllers
        # views
            # layouts
                # application.html.erb - main layout file of application where all views get served through. Makes all stylesheets javascript available to views. The <$= yield %> is where other views will be inserted in order to inherit these styles and functionality
# config
    # configuration - configuration settings will be stored and defined here also holds credentials and routes.rb
        # routes.rb - defines routes within the website
        # environments - defines different configurations and environments needed
# db - holds development and test databases (sql light)
    # schema file - will have an overall structure of data base in an easy to read file containing table names and what kind of data they contain (column details)

# Gemfile - list all gems used to create the application.
# Gemfile.lock - all versions and dependencies of used gems get "locked" in. This file is changed when the Gemfile is changed 
# package.json - used to list versions and dependencies that are added to the app using yarn
# readme.md - markdown file that is displayed in the repository. Can provide information about the app and be styled with markdown
# hidden files - start with "." and do not show up by default





#===============================#
#       63. Teacher Notes:      #
#===============================# 

# Structure of a Rails application - Text references
# You can find the details of the individual folders in a Rails application (when it's created) here: https://guides.rubyonrails.org/getting_started.html

# Scroll down to section 3.2, skip the part about creating the new application and then you will find a listing of all the folders and their purpose in-depth.




#=========================================#
#       64. Version Control With Git      #
#=========================================#

#  Allows an easy way to track changes in the code

# Track Files
# start the process by tracking the files and folders in an application
# When tracking is started is where the initial state of the application will be
# Usually this is done as soon as the application is created

# Make Commits
# When we make changes to our code or add new code/files/folders we can choose to add new files to track as well
# Once we are happy with the changes we can make a commit of our code
# Commits include a helpful message as well with information about the code being saved or commited
# Commit is like a saved version
# Everytime you make a commit you create a copy of your new version.
# This means we can revert and go back to previous versions

# Install git 

# set global variables for username and email and set text editor for commits
# $git config --global user.name "Name Here"
# $git config --global user.email email@email.com
# $git config --global core.editor "vim"

# set up ssh keys (help.github.com)
# check if you already have an ssh key
# $cat ~/.ssh/id_rsa.pub
# Generate a new ssh key
# $ssh-keygen -t rsa -b 4096 -C "yourgithubemail@email.com" 
# When prompted to enter a file name press enter for default
# At prompt type a passphrase
# It is needed every time you push so make it memorable  
# to change it later use:
# $ ssh-keygen -p -f ~/.ssh/id_dsa
# pull up ssh key and copy it
# linux:
# $sudo apt-get install xclip (installs xclip)
# $xclip -sel clip < ~/.ssh/id_rsa.pub (uses xclip to copy file contents)
# paste it into github under settings -> ssh and gpg keys


# When creating an application you have to initiate the repository before you can track changes. 
# Be sure to be in the directory that you want to track
# This step is done automatically when creating a new application when using  $rails new app_name
# $git init

# add files to a commit
# -A adds all files with tracked changes to commit
# $git add -A

# Specify where your repo should be pushed to 
# $git remote add origin git@github.com:githubaccountname/gitreponame
# See the sets of tracked repositories for a local repo
# origin is the online repo that we will push to and pull from
# -v shows remote url after the name
# git remote -v

# Push your repo to github
# origin specifies where to push to (see $git remote -v) master specifies the branch to push to
# git push origin master


# See which files have been added to a commit and which ones have not
# $git status

# To remove a file that was added so it isn't included in the commit we are about to make
# $git rm --cached <filename>

# Commit added files to be pushed
# This command will open up a vim session where you can write a commit message
# Message can include a headline (50 chars?) and several paragraphs underneath
# $git commit 





# to exclude files that we don't want tracked with git use the .gitignore file
# simply list the path to files that you don't want included and git will not track changes.
# Comments can be added with "#" symbol
# "*" can be used to include all files in a folder or all of any title with an specific extention (*.json)

# See a history of commits in an easy to read way
# $git log --graph --decorate --abrev-commit --all --pretty=oneline

# See the sets of tracked repositories for a local repo
# origin is the online repo that we will push to and pull from
# -v shows remote url after the name
# git remote -v

# Book: https://git-scm.com/book/en/v2



#==============================#
#       65. Teacher Notes      #
#==============================#

# Version control with Git - text references
# Git references:

# Official site: https://git-scm.com/

# Free online Pro Git book: https://git-scm.com/book/en/v2

# Reference manual: https://git-scm.com/docs

# Upon download and installation in your local machine (AWS Cloud9 comes pre-installed with Git), first time setup steps are required (only one time) for your git installation (for all environments):

# git config --global user.name "Your name"
# git config --global user.email youremail@example.com
# replace "Your name" and youremail@example.com above with your actual name and email address which you want shown on your repos.

# To display git config settings, use the following command:

# git config --list

# Some useful git commands:

# Your rails application already comes initialized with a Git repository. But if you have to initialize a git repository for an application you are working on, you can use the following command (do this from within the application directory):

# git init

# Note: if using Rails 5 or above, your application will already come with a git repository initiated, if you initiate a new one, it'll simply do the same step again.

# To add/track all files, use the following command:

# git add -A

# To commit changes/updates/additions to repository, use the following command:

# git commit -m "A useful message to help remember details of commit"

# To check current state of file updates with already tracked/committed code in repo, check git status with the following command:

# git status

# To reject latest changes, you can use the following command:

# git checkout -f

# Sites to create free online code repositories:

# github.com

# bitbucket.org

# Setup online code repo with Github - Text directions and references
# You can sign-up for a GitHub account at https://github.com/

# Once signed-up, you can follow the steps in the video to create a new repository for your application.

# If you chose SSH as the option to push existing repo, you will need to set up an SSH key unless you already have one.

# To display your public SSH key:

# cat ~/.ssh/id_rsa.pub

# If you don't have an SSH public key or are not sure, checkout the instructions here: https://help.github.com/en/github/authenticating-to-github/checking-for-existing-ssh-keys

# When creating a GitHub repo for your application, you can click on the SSH button, then push existing repo:

# git remote add origin git@github.com:yourgithubaccountname/test-app-6.git

# git push -u origin master # Remember you only need to use this command the first time

# To view remotes setup in your environment (from your app directory):

# git remote -v

# For future pushes to repository:

# git push origin master




#===========================================================#
#       68. Front-End: Learn and Practice HTML and CSS      #
#===========================================================#

# TO PRACTICE HTML USE mdn html basics: https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/HTML_basics
# TO PRACTICE USE mdn css basics: https://developer.mozilla.org/en-US/docs/Learn/CSS
# TO PRACTICE USE shayhowe html css: https://learn.shayhowe.com/html-css/

# Know what HTML tags are: h1 tages, p tags etc., and the syntax

# Know how to style classes and ids using css at a basic level

# know the difference between in-line and external CSS used in HTML documents

# At a basic level know what forms and tables are and how to create them




#=======================================================#
#       70. Add About Page and Homework Assignment      #
#=======================================================#

# When launching a fresh project the only page available by default is the home page (localhost:3000)
# If we want to add a new page it must be added to routes.rb
# The 'root' in the page specifies where the landing page will be (The home page url without any slashes)
# Setting get allows us to specify where a url should go when we start adding paths or slashes (localhost:3000/about)
# To set in the root route use:
    # get 'about' to: 'pages#about'
        # 'to:' is used to specify which controller to use and '#' is used to specify which action should be taken in that controller
        # Note: the _controller.rb part of pages shouldn't be specified since rails is familiar with the layout and knows what to expect
# Now that ruby knows to look in pages we have to define a function matching whatever was after the '#'
# In pages_controller.rb within class PagesController create a new function
    # def about
    # end

# Now we have to make the function actually do something and load a view to display otherwise rails doesn't know what to show the user
# First we have to create the HTML 
# Go to the views folder that matches the name of the controller used (pages) and create a new file with the same name as the url extension/route/function just made.
    # about.html.erb

### HOMEWORK ###

# 1. Create a new rails application called alpha-blog
    # Make sure you are out of your existing rails application when creating this, it's a common mistake by beginners to launch an application from within the application they're working with already.

    # done in ../../RubyOnRails/rails_5_projects
    # $rails _5.2.4.1_ new alpha_blog



# 2. Once created, set up a git and github repository for it. Make a commit of your code with the message "Initial commit".

    # Create repo on github.com
    # cd into alpha_blog
    # $git add -A
    # $git commit -m "Initial commit"
    # $git remote add origin git@github.com:jnhthomp/alpha_blog.git
    # $git push -u origin master

# 3. Create two routes for it, one for the home page as the root route which simply says "This is the Home page." and another for the about page. Just like in the test_app_6 application

    # for home:
        # in config/routes.rb add:
            # root 'pages#home'
        # in app/controllers create pages_controller.rb
        # add home function
            # def home
            #
            # end
        # in app/views create pages folder
        # create new file home.html.erb
            # add content: <h1>This is the Home page</h1>
        
    # for about:
        # in config/routes.rb add:
            # get 'about', to:'pages#about'
        # in app/controllers/pages_controller.rb
        # add about function
            # def about
            #
            # end
        # in app/views/pages create new file about.html.erb
            # add content: <h1>This is the About page</h1>


# 4. Make sure you are able to start the server and see both pages from the browser. Take snapshots of both pages and post them in the Q&A of this video.

    # No thanks


# 5. Once done, make another commit of your code, and push the code to your github repository and share the Github repo link in the Q&A as well.

    # https://github.com/jnhthomp/alpha_blog





#==============================#
#       71. Teacher Notes      #
#==============================#
# Add About page and homework assignment - Text reference and code
# To add an About page to the application, first add the following route to the config/routes.rb folder:

# get 'about', to: 'pages#about'

# You can then add the about action to the pages controller like below:

# def about
# end
# Now you will need a view template, so add an about.html.erb file under the app/views/pages folder and fill in some text to display within it:

# <h1>This is the About page</h1>

# Once you save the file, you'll be able to preview this page by appending /about to your homepage. In your local machine it would be localhost:3000/about

# Homework:

# 1. Create an alpha-blog application.

# 2. Setup tracking with Git and make a commit of your code with the message "Initial commit". Set up a GitHub repository for the app.

# 3. Create a home page view (as the root route) and an about page like the test app.

# 4. Make sure you are able to start the server and preview the application. Take snapshots of the two pages (home and about) and post them to the Q & A.

# 5. Make a commit of your code and push to your GitHub repository for the application.




#===================================#
#       72. Production Deploy!      #
#===================================#

# Heroku can be used to deploy projects to the internet for people to be able to access
# This is beneficial because then we can go to an actual website to view our application
# We can share our live projects w/ friends/family/employers and link them in portfolios

# heroku.com
# Easy to use production hosting environment
# Completely seperate from local environments
# Database is not transmitted
# Once deployed we will need to create our own production database
    # heroku can help with this
# 

# You can sign-up for a heroku account at: https://www.heroku.com/

# Preparation for production deployment:

# - Remove sqlite3 gem from top of your Gemfile to within group :development, :test do block

# Mine looks like below:

# group :development, :test do
#   gem 'sqlite3', '~> 1.4'
#   gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
# end
# - Create a group production ->

# group :production do
#   gem 'pg'
# end
# - Save Gemfile

# - Run bundle install --without production to update Gemfile.lock file

# - Commit your changes to git repo ->

# git add -A

# git commit -m "Make app production ready"

# You can check if you already have Heroku CLI installed by going to your terminal and typing in:

# heroku --version

# or simply heroku

# You can get the Heroku CLI from here: https://devcenter.heroku.com/articles/heroku-cli

# Check Heroku installation:

# heroku --version

# heroku # for list of common heroku commands

# Once installed, login to your Heroku account from your application directory:

# heroku login

# To create a new production version of your app hosted in Heroku, use the following command:

# heroku create

# To push your application code to Heroku and deploy your app, use the command below, but make sure all your code changes are committed by checking git status first (following the steps in the beginning of this text lecture) ->

# git push heroku master

# To change the name of your application ->

# heroku rename newnameofyourapp

# replace newnameofyourapp above with the name you'd like to give your app

# Your app will then be accessible from the following browser URL ->

# https://newnameofyourapp.herokuapp.com




#==========================================================#
#       74. The back-end: Databaseand Tables in Rails      #
#==========================================================#
# Think of these as independent from rails application
# They are their own general database management sysetm

# Database
    # Persistence layer of the application
    # Where all data resides
    # Communicates with the application through the model
    # Made up of multiple tables which store information
        # Tables are similar to excel spreadsheets (but not really)
        # Some tables are linked to other tables using columns that have common information to identify relationship between the tables
        # This is why they are called relational databases
            # exampe:
            # table 1 (USERS) - stores user information for app users
                # id - unique to each user
                # name
                # email
                #password
            # table 2 (ARTICLES) - list of all articles created and stored 
                # id - unique to each article
                # title
                # deescription
                # user_id (id of author)
            # Each of these two tables share the user_id column
            # This means we could find information about the author when given the article
            # This is the basis of relational databases
    # Tables are have several parts
        # Attributes
            # These are like column headers and describe what information the column contains
        # Columns
            # Columns hold the data underneath each attribute (id column, name column, email column, password column)
            # This is just the data for each individual attribute
            # ID columns are automatically generated by rails
            # All rows must have values for each column 
        # Rows
            # Entries of correlating data
            # Contain data about each attribtue
            # These would refer to each individual user/article
    # What kind of actions would we want to be able to do to a table like users or articles
        # Make changes
            # These operations are refered to as CRUD
            # These are the basis of operation for almost all database systems
            # Create a new user/article     - C
            # Read a user/article's values  - R
            # Update a user/article row     - U
            # Delete a user/article row     - D
        # Interact with the database
            # We will need a query language in order to perform the above actions
            # The most common one is called SQL (Structure Query Language)
            # There are several different variates but all use the same general structure and principles

# Active Record (MODELS)
    # Middle man between rails and database known as ORM
    # Communicates between rails application code and database
    # Rails can use ruby/rails language in order to communicate to the database
    # This is because ORM translates the ruby commands to SQL to perform the actions
    # You can see application_record.rb in app/assets/models/application_record.rb
        # You can see it inherits from ActiveRecord::Base
            # ApplicationRecord < ActiveRecord::Base
        # This makes it so we can communicate with the database using ruby without having to run SQL commands 







#===================================================================#
#       75. The back-end: CRUD, Scaffold and Wrap-Up Section 3      #
#===================================================================#

# How rails communicates using models and the above components

# Generate a scaffold
# $rails generate scaffold NameOfTable columnName1:type columnName2:type  

# This will generate several files that give our application access to the database as well as some tests that can be done it
# in order to create a database we have to run the ruby file that was created in ~db/migrate/3478965348593485_create_nameoftable.rb
# We can see in this that it has a function to change and in it it can create a table
# You can also see the columns that were used as well as the timestamps
    # Timestamps is going to give a createdat and updatedat field which rails will update automatically 
# Run this file to create table:
    # $rails db:migrate
    # Creates a schema.rb file
        # This contains a list of tables and their columns
    # Creates development.sqlite3 file
        # This is the sqlite database for the application in dev environment
    # Creates ~app/controllers/nameoftable_controller.rb
        # Autofilled with a lot of code
    # Creates ~app/models/nameoftable.rb
        # Allows us to communicate with database
    # Adds in ~config/routes.rb
        # resources :articles
        # This gives us routes to access the articles table
        # View these routes with:
            # $rails routes --expanded
        # an example route would be
            # Route 1
            # Prefix: nameoftable
            # verb: GET
            # URI: /nameoftable(.:format)
            # Controller#Action: nameoftable#index
        # This means we can go to localhost:3000/articles and see all entries in the table
        # Since there was an index action that means there was a view created for it
        # This view is formatted to show contents of the table
        # There are also POST versions of these routes that allow us to push data to the database
        # another route specifies a URI of /nameoftable/new
            # from here we are brought to a form we can use to add a new row to the database
            # after doing this there will be a new row for the table that you can view on localhost:3000/nameoftable
        # there is an edit route that uses the id of an entry
            # localhost:3000/nameoftable/{id}/edit
            # This leads to a page where you can edit the data of an entry
        # below that there is a delete request that allows deltion of an entry
            # This doesn't lead to a page but will run a command that will destroy the entry

# SQL queries
    # https://www.w3schools.com/sql/





#===============================#
#       76. Teacher Notes:      #
#===============================#

# CRUD and scaffold generators - Text directions, references and code
# Query language to communicate with database: SQL (Structured Query Language)

# CRUD actions:

# C - Create

# R - Read

# U - Update

# D - Delete

# Scaffold generator command to create an article model (with two attributes), articles controller, views for articles and migration file to create articles table:

# rails generate scaffold Article title:string description:text

# Command to see routes presented in a viewer-friendly way:

# rails routes --expanded

# The line resources :articles in the config/routes.rb file provides the following routes:

# - index of articles (GET request)

# - new article (GET)

# - create article (POST)

# - edit article (GET)

# - update article (PUT and PATCH)

# - show article (GET)

# - delete article (DELETE)

# From UI perspective ->

# - index lists all the articles in the articles table in the database of the app

# - new article deals with the form to enter in new article details

# - create handles the submission of the items in the new article form

# - edit article deals with the form to enter edited information for an existing article

# - update article deals with the submission of the edit article form

# - show article displays an individual article based on selection

# - delete article deletes an article from the articles table

# In preparation for the next section, learn and practice SQL here: https://www.w3schools.com/sql/

# Overview
# Q&A
# Notes
# Announcements
# Search all course questions
# Search all course questions




#===================================#
#       77. Quiz: Rails Basics      #
#===================================#

# What does C in MVC stand for?
    # Code
    # Command
    # Controller => true

# What are CRUD operations?
    # Create, read, update, delete => true
    # Code, read, update, delegate
    # Create, release, update, dream

# What 7 general actions do Scaffold generators generate?
    # index, new, edit, show, cretae, update, destroy => true
    # indent, new, edit, display, create, update, delete
    # indent, serve, occupy, remove, clean, delete, repeat