#================================================================#
#            Section 3. Introduction To Ruby On Rails            #
#================================================================#










#====================================================================#
#            53. Intro to Section 3 Ruby on Rails Kickoff            #
#====================================================================#

# Extra info at: rubyonrails.org

# Ruby on Rails is a framework that is used to develop web apps
#   Almost all modern websites are webapps
#
# Ruby on rails makes building web apps much easier than coding everything yourself
# This is because Ruby on rails has a bunch of built in processes, prebuilt functions, and automation
#
# All of ruby's extra packages that make rails so powerful are available at:
#   rubygems.org
#   github.com/rails/rails for rails source code

# At the beginning of the course we will mostly build them from scratch so we understand how they work
# Once we understand how they work and how to make them we can start using premade gems










#================================================================================#
#            54. Instructor Notes: Sect 3 Intro Ruby on Rails Kickoff            #
#================================================================================#

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















#============================================================================#
#            55. Model, View, Controller, and Rails App Structure            #
#============================================================================#

# Model, View, Controller (MVC) is a popular app structure for web apps regardless of whether or not they are using rails
# The point of MVC is:
#   Clearly organize code and functions
#   Keep data from being accessed where it does not need accessed
#   Seperate what is happening on the backend with what is happening on the front end
#
# Models
#   Models are resources in an app (user, post, article, stock)
#   These are things that are likely to be stored in a database
#   In rails you can use models to communicate with your database tables
#
# Views
#   Views make up the front end of the application
#   Controlls what the user sees
#   Usually html, css, and javascript
#   different pages on a website
#
# Controller
#   Drives the flow of the webapp
#   Executes actoins
#   Facilitates communication between the model and view
#   Sometimes the view will need data that is stored in the model
#     The controller will get that data from the model and only pass on what the view needs
#   "Brains" behind the application










#=========================================================================#
#            56. Instructor Notes: MVC and Rails App Structure            #
#=========================================================================#

# MVC - Model, View, Controller

# General flow of Rails application:

# -> Request made at browser

# -> Request received at router of rails application

# -> Request routed to appropriate action in a controller

# -> Controller#action either renders a view template or communicates with model

# -> Model communicates with database

# -> Model sends back information to controller

# -> Controller renders view















#================================================================#
#            57. Required: Ruby on Rails Installation            #
#================================================================#

# A local installation of Ruby on Rails is required to continue beyond this point
# A cloud based ide like Cloud9 will also work















#=======================================================================#
#            58. Root route, Controller, MVC + "Hello World"            #
#=======================================================================#

# Goals
#   Display "Hello World!" in browser (not default view)
#   Formalize using rails convention
#   Review MVC diagram for information flow

# First to create a new rails application (Rails 6)
#
# Install bundler (ensures that gems needed exist):
#   $gem install bundler
#
# Install webpacker (Should help speed up Rails install as it is needed):
#   $gem install webpacker
#
# Install Rails:
#   $gem install rails
#
# Check rails version to ensure it downloaded correctly:
#   $rails -v
#
# Navigate to the directory where you want to create your project
#   $rails new name_of_app
#   This will create a new directory with the application name
#
# Test that your app was made correctly with rails server
#   navigate into the project folder
#   rails s
#   In browser visit localhost:3000
#   To stop server use ctrl+c in terminal

# Root Route
#   When using rails server what is shown on localhost:3000 is known as the root route
#   It is the page that shows up by default when navigating
#   Root route is the default homepage (domain.com)

# How do we change the root route to show what we want?
# We have to use the "routes" file in our app
#   config/routes.rb
# Within that file there is a do block where are our routes are stored 

# We want our root route to point to a controller
# Models, Views, and Controllers are all located in their respective folders in the "app" folder
# In a new project the only controller present is the application_controller.rb

# In rails when you specify the file in the route rails already knows it is a controller 
#   so you only have to include the fist part of the file name (application)
# The whole line in the routes folder should read:
#   root 'application'

# Within the application controller we need code to handle the request 
#   (What will be shown or done)
# But first in the routes.rb file we have to call the method we will be creating
# To do that update the line with a (#) immediately following the controller name and the method that should be run
# Now the line in routes.rb should read:
#   root 'application#hello'

# Now we can write the method that will run when someone loads the homescreen
# In app/controllers/application_controller.rb (within the ApplicationController class):
#   def hello
#  
#   end

# Load the page (use $rails s and navigate to localhost:3000)
# Now we have an error 'is missing a template for request formats:text/html'
# In order to fix that we have to render a template
# within the hello method we just wrote
#   (in app/controllers/application_controller.rb ApplicationController class)
#   def hello
#     render html: "Hello World"
#   end

# Now we have a page that says "Hello World!"

# This is fine for learning but not how we load a webpage
# What about using a .html file?

# Lets look at rails convention and see what next steps are
# Generate a view
#   Conventional expectations
#     Define a route that points to a controller#method
#     Have an appropriately named controller (pages controller controls pages)
#     Have an appropriately named action/method (for a root route home could be appropriate)
#     If this is done then in the views folder rails will expect a pages folder
#       This is named after the controller name
#     Within that folder rails will expect a home.html.erb file
#       This is named after the action in the controller that was used 
#
# So far we have done the first three. Now to provide an appropriate folder and html.erb file for rails
# We are going to restart so that way we can build these from scratch
# Clear the app/controllers/application_controller.rb so only the class remains
#
# Change the line we wrote in routes.rb to:
#   root 'pages#home'
# 
# Now we have to:
#   Create a pages controller
#   Define a home method
#   Create a pages folder in our views folder
#   Create a home.html.erb within pages folder 

# First to create the pages controller we are able to generate this via terminal
#   Do this in a new tab or you must stop the server
#   $rails generate controller pages
# This will create a new controller for us called pages along with some other items:
#   app/controllers/pages_controller.rb         <-- pages controller
#   app/views/pages                             <-- folder for our .html.erb files
#   test/controllers/pages_controller_test.rb   <-- we can specify tests to run here to make sure the pages is working properly
#   app/helpers/pages_helper.rb                 <-- Can be used to format things for views
#   app/assets/stylesheets/pages.scss           <-- SASS file we will use to edit css for the .html.erb file
# Right now we only care about the app/controlelrs/pages_controller.rb and app/views/pages

# Now to create a "home" method in the pages controller, just like we did in the application_controller.rb 
# In app/controllers/pages_controller.rb in PagesController class
#   def home
#   end
# 
# That's all we have to do in the controller
# Because of ruby convention it will now look in app/views/pages for home.html.erb
# That doesn't exist yet so let's make one
# in app/views/pages create a new file called home.html.erb (erb stands for embedded ruby)
# In the file that was just created:
#   Hello There!

# Now we have successfully loaded an html page!

# Currently the flow is:
#   User asks for home page
#   Root route looks for a controller assigned to the home page (root)
#   Root calls that controller and method
#   Controller looks for any views that are named after the method called
#   If a view is found it is sent to the user









#=============================================================================#
#            59. Instructor Notes: RR Controller MVC 'Hello World'            #
#=============================================================================#

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















#============================================================#
#            60. Structure of a Rails Application            #
#============================================================#

# Before moving on let's take a look at the structure of rails applications by folder

# app
#   assets
#     images
#       # Where images that are displayed on the website are stored (ex: banner images)
#     stylesheets
#       # SCSS (fancy css) files to make views pretty
#   channels
#     # application cable. Facilitates real time communications.
#   controllers
#     # Controllers for running pages and getting data
#     # application_controller is the main driver
#     # All functionality available to application controller is available to all other controllers as well
#   helpers
#     # holds helper methods for our views to format data better 
#   javascript
#     # In rails 4 & 5 javascript folder is in the assets folder
#     packs
#       # has application.js main js manifest file
#       # application.js makes javascript available in our app
#   models
#     # Models that we create will be stored here (database tables)
#     # application_record.rb
#   views
#     # Where folders (correlated with controllers are stored)
#     # each folder has pagename.html.erb files in them
#     layouts
#       application.html.erb
#         # all views are routed to the <%= yield %> tag in this html file
#         # that means this html file is every page in the app it just holds the appropriate html file when it needs to
# bin
#   # Don't worry about this right now we won't use it much
# config
#   # This is where configuration will be done such defining different configurations between development and production
#   routes.rb
#     # Decides where to route requests based on what page or data a user requests
# db
#   # where development and test database locations
#   # For both development and testing we will use sqlite which comes by default with ruby on rails
# .gitignore
#   # list of files that should be ignored by git and not tracked for version history
# Gemfile
#   # list of all gem used in the application 
#   # this makes it easier to load the project and import any needed assets when developing
# Gemfile.lock
#   # Saves or locks all dependencies and their versions from the Gemfile
# package.json
#   # lists versions and dependencies added by yarn
# readme.md
#   # Displayed in the code repository for the application
#   # Gives information about what the application does and how to use it









#======================================================================#
#            61. Instructor Notes: Structure of a Rails App            #
#======================================================================#

# You can find the details of the individual folders in a Rails application (when it's created) here: https://guides.rubyonrails.org/getting_started.html

# Scroll down to section 3.2, skip the part about creating the new application and then you will find a listing of all the folders and their purpose in-depth.















#====================================================#
#            62. Version Control With Git            #
#====================================================#

# Git is a version control system that tracks changes to files
# With git when you make a change the change is what's recorded
# That means it is easy to go back to previous versions of something by undoing the changes
# You can also create branches so there are multiple versions of the project at once
# Then those branches can be merged together when a feature is complete instead of having a WIP on the main branch

# These features make it much easier to go back if something is messed up
# When sharing development on a project multiple people can make their own changes without affecting the work of others

# Track Files
#  The files and folders in the application are tracked
#  When the files are first tracked will be the earlies initial state of the application

# Make Commits
#   When changes are made (changes code, adding files etc.) we can make a commit
#   It is like a saved version with a helpful message about the code that is being saved
#   When a commit is made an exact copy of your application at the point of the commit is saved
#   Eventually you will have a commit history showing the progression of the app
#   You can then jump backwards to any version needed

# Commit History
#   Commit a: 'Create application'
#   Commit b: 'add root route'
#   Commit c: 'add about page'
#   Commit d: 'add home page styling'

# Commands
#   $git config --list
#     Shows all variables associated with git account

#   $git add *  #(You can also use: git add -A)
#     add all untracked files (except those in .gitignore) to the commit

#   $git rm --cached <file>
#     remove an added file from a commit

#   $git commit -m "Message about commit"
#     make a commit (save point) along with a short message or description about what was done

#   $git status
#     shows whether there are any file changes that can be added or any commits that can be pushed to the master online repo


####    Homework Assignment    ####
# Go to git-scm.com/doc and read the "Pro Git" book or watch the videos










#======================================================================#
#            63. Instructor Notes: Version Control With Git            #
#======================================================================#
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















#====================================================================#
#            64. Setup Online Code Repository with GitHub            #
#====================================================================#

# Sign in into github or bitbucket or some other version control repo site

# Make sure you have an SSH Key created for your local machine and it is uploaded to git
#   Check for an shh key
#     $ls -al ~/.ssh

#   If you do not have an ssh key:
#     $ssh-keygen -t rsa -b 4096 -C "your_email@email.com"
#     Press enter for default location
#     At the prompt type a secure passphrase

#   To copy an ssh key: (This will show it in terminal select it then copy/paste)
#     $cat ~/.ssh/id_rsa.pub
#   Copy that ssh key into your github account in user settings -> ssh keys

# Now we will create an online repository with new button in top left

# Once you have named your repo, chose a description, and selected public or private:
#   Add the remote url to local git so it knows where to upload to:
#     $git remote add origin git@github.com:username/repo_name.git

#   See where you are uploading to
#     $git remote -v
#     =>origin git@github.com:username/repo_name.git # There are 2 lines for fetch and push

#   Push your local commits to the online github repo
#     $git push -u origin master










#==============================================================================#
#            65. Instructor Notes: Setup Online Code Repo w/ Github            #
#==============================================================================#

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















#======================================================================#
#            66. Front End: Learn and Practice HTML and CSS            #
#======================================================================#

# Goals:
#   Know what HTML tags are: h1 tags, p tags etc. and the syntax
#   Know how to style classes and ids using css at a basic level
#   Know the difference between in-line and external CSS used in HTML
#   At a basic level know what forms and tables are and how to create them

# HTML 
#   More info at: https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/HTML_basics
# CSS
#   More info at: https://developer.mozilla.org/en-US/docs/Learn/CSS
# HTML & CSS
#   https://learn.shayhowe.com/html-css/










#=============================================================================#
#            67. Instructor Notes: Learn and Practice HTML and CSS            #
#=============================================================================#

# HTML basics: https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/HTML_basics

# CSS basics: https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/CSS_basics

# HTML tables: https://developer.mozilla.org/en-US/docs/Learn/HTML/Tables

# HTML forms: https://developer.mozilla.org/en-US/docs/Learn/Forms/Your_first_form

# Alternate resource to learn HTML and CSS together while building a website: https://learn.shayhowe.com/html-css/















#=========================================================#
#            Exercise 1. Create HTML p Element            #
#=========================================================#

# Create and HTML paragraph element using the <p> tag. Be sure to close the tag also.

####    SOLUTION    ####
# <!DOCTYPE html>
# <html>
# <head>
# <title></title>
# </head>
# <body>
#   <p> This is in a p tag </p>
# </body>
# </html>















#=============================================================#
#            Exercise 2. Create an Unordered List             #
#=============================================================#

# Create an unordered list using the <ul> tag
# The list should contain four elements
#   Elements are enclosed with <li> tags

####    SOLUTION    ####
# <!DOCTYPE html>
# <html>
# <head>
# <title></title>
# </head>
# <body>
#   <ul>
#     <li>item 1</li>
#     <li>item 2</li>
#     <li>item 3</li>
#     <li>item 4</li>
#   </ul>
# </body>
# </html>














#============================================================#
#            68. Add About Page and HW Assignment            #
#============================================================#

# Now let's add another page that a user can visit
# Let's start with an about page

# What error do we get if we try to visit an about page that doesn't exist?
# Go to localhost:3000/about (start rails server if you haven't)
# => 'No route matches [GET] "/about"'

# So we don't have any routes that match /about so we have to add that first
# in config/routes.rb
# Below the root route line:
#   get 'about'

# This makes a get request for a page called about
# Since this is a static page we can add an about action to our existing pages controller
# to add the pages controller to the route: (add to the existing line we just wrote)
#   get 'about', to: 'pages#about'
# This tells rails too look in the pages controller for an about method

# Reloading the page we can see a different error now
# => 'The action "about" could not be found for PagesController'

# Now we have to create an about method in the pages controller to tell the page what to load
# in app/controllers/pages_controllers.rb below 'home' method:
#   def about
#   end

# Now reloading we get an error saying there was no template found
# So we have to create an about.html.erb file in the pages folder
# in app/views/pages create a file about.html.erb
# In the created file add any desired html that would normally go in a body tag

# Now we have an about page!

# Update the home page to put the title in <h1> tags




####    HOMEWORK    ####

# Create a new rails application called alpha-blog
#   Make sure you are not in another project when doing this; this is a common rookie mistake
# Set up a git and github repo
# Make a commit with message "Initial commit"
# Create two routes for the project
#   One route for home page as root route
#     Says this is the home page
#   One route for about page 
#     Says this is the about page
# Check that both pages load in the server
# Make a commit and push changes to github










#===================================================================#
#            69. Instructor Notes: Add About Page and HW            #
#===================================================================#

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















#==============================================#
#            70. Production Deploy!            #
#==============================================#

# Now that you have made the alpha-blog application you can put it on an actual website
# This allows you to see them from anywhere!

# To do this we will use a platform called heroku
# It will work similar to github except when we push code to production we will push to heroku instead of github

# Sign into heroku.com
# Keep in mind that the local environment and production environments are completely seperate
#   Databases in production will be seperate from databases in development

# More info: https://devcenter.heroku.com/articles/getting-started-with-rails6

# First we need to set up command line tools
# Check if they are intalled by using:
#   $heroku

# If not for WSL use the following command: (found at https://dev.to/twiddlewakka/heroku-cli-on-wsl-26fp)
#   $curl https://cli-assets.heroku.com/install.sh | sh
#   NOTE: If commands don't work try adding "-a your-app-name" to the end of your command

# Login to Heroku in cli
#   $heroku login
#   Will redirect browser, click login and then you should be logged in in the terminal

# Navigate to the application directory

# Create a production version of the application
#   $heroku create
#   This creates an application and provides a link where you can access it

# Before we deploy code we have to get application code production ready
# That means we have to set up our database gem for production

# In the project open 'Gemfile'
# We can see that we are using sqlite 3 from the Gemfile
# This is not what we want to use in a production database because it is not strong enough
# Heroku uses PostGresSQL

# To enable the database gem we want to use we have to add it tothe Gemfile
# Create a new group called production below all the other groups
#   group :production do
#    gem 'pg'
#   end

# Since we don't want sqlite enabled in production we need to move it to be inside the groups it is needed
# If it is outside it will be available to all groups and we do not want it available to production
# Cut the line "gem 'sqlite3', '~> 1.4'" from the public section of the gem file
# Paste that line into the 'development' and 'test' groups

# Update the app to have the correct gems but we don't want to include production
#   This is because we don't need production gems installed on the local machine since it is not a production environment
#   On larger projects this could result in a lot of excess data that you don't need on your machine
# Use the command:
#   $bundle install --without production
# This will make the necessary updates to the Gemfile.lock which is used in production

# Now we need to make a new commit or it will not upload correctly
# Make commit as normal

# Now to push to heroku
# Use command:
#   $git push heroku master 
# This will push to heroku instead of github and when it is finished will provide a link we can use to visit the site
# You can also open with the following command:
#   $heroku open (doesn't work in wsl because wsl doesn't have a browser or )

# You can now find this application in the heroku dashboard

# You can also rename the url to a custom url so you don't have to remember a random one
# Use the following command
#   $heroku rename name-you-desire
#   NOTE: Keep in mind some names may not be available if someone has taken it already










#================================================================#
#            71. Instructor Notes: Production Deploy!            #
#================================================================#

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















#======================================================================#
#            72. The Back End: Database and tables in Rails            #
#======================================================================#

# Model View Controller (MVC)
# Now we have messed with views and a bit with controllers now it is time to visit models

# Models deal with the persistence layer of your app
#   Persistence layer is data that doesn't go away when you close the app
#   A Model's job is to communicate with the database
#   Thik of models as independent from the rails app as if it is it's own thing

# Databases are usually made up of multiple tables
#   Tables store information in rows and columns (similar to excel spreadsheets)
#     Names of columns are called 'attributes'
#     Rows hold data
#   Some tables are linked to other tables using columns that have common information (keys)
#   This helps identify the relations between tables
#     This is why they are called relational databases

# Database ex:
#   Users table
#     id  |   name  |   email   | password
#     1      test    test@email  pass1
#     2     test2    2mail@email pass2
#
#   articles table
#     id  |   author_id   |  title   |   description
#     1         2            Blog      news stuff
#     2         1            art       pretty colors
#
# *id column is automatically generated by rails
# The two tables above can be used to link a user and articles they have written

# What kind of actions would we want to perform on an article?
# Create articles
# Read articles
# Update articles
# Delete articles
#
# These are known as CRUD they are the basis for any database system

# We will need a query language to communicate with our database systems
# The most common one is called sql (Structured query language)

# We use something called ActiveRecord in our application to communicate between our app code and database
# This makes it so we don't have to type in sql queries in our rails app and can instead use ruby and ActiveRecord will take care of it
# You can find this file in the app/models/application record















#=======================================================================#
#            73. The Back-End: CRUD, Scaffold and Wrap up S3            #
#=======================================================================#

# Let's look at how rails communicates with the database using models

# Let's use test_app_6 for practice
# So far it has a home page and about page 

# We want to give this app and 'articles' resource
# This means we will do the following:
#   Create 'articles' table
#   Create 'articles' model
#   Create 'articles' controller
#   Create any views needed
#
# Luckily rails let's us do this with 1 line
# (For learning purposes we are only using one line here
#   going forward we will do it ourselves fro scratch)
# Use command: (in test_app directory)
#   $rails generate scaffold Article title:string description:text 
#     This will create the necessary files and model for a table
#       The table will have the name 'Articles'
#       'Articles' will have columns title, and description
#       title will hold data that is a string
#       description will hold data that is text (bigger than string)

# What did that do?
# Invoked active_record and created migration file
# the migration file is what is used to create the article table
# it created a model, tests, and a bunch of routes with resources :articles in routes.rb
# Created articles controller so we can direct requests from browser
# Created a bunch of views

# Now we can run the migration file in order to create the table
# db/migrate/2787443875_create_articles.rb
#   From this file we can see that it is creating a table called 'Articles'
#     this table will have 3 columns, title, description, and timestamps
#       timestamps is special and gives created at and updated at
# to run migration file:
#   $rails db:migrate

# Now the Articles table has been created
# Looking at the db folder we now have some additional files in db folder
#   schema.rb
#     shows that there is an articles table with title, description, created at, updated at
#   development.sqlite3
#     This is the database in the development environment
# There are also some changes in the app folder
#   controllers/article_controller.rb
#     There are now a bunch of methods for the article table that we will get into next section
#   models/article.rb
#  
# config/routes.rb
#   resources:articles
#     this added line allows us to request data from the database and perform CRUD actions
#     This is because when something like url/articles is requested when performing the migrate and scaffold it created
#       an articles_controller to route requests to the articles views where there is an index that will display

# to see the new line in routes.rb in action start rails server
# Navigate to localhost:3000/articles
# It shows all the data in our articles table! (but it is empty)

# Post
# one of the other routes we got in routes.rb is POST
# We can see the the route for creating a new article is articles#new so got to localhost:3000/articles/new
# This allows us to create new articles
# This works in conjunction with articles#create in the articels_controller.rb
# Now an article shows in the articles table in the database

# edit_article
# This route leads to article#edit
# This is a patch request that updates an existing value

# Delete
# this route leads to article#destroy

# This will be covered much more deeply in the next section #

#### To get a better understanding of SQL visit: https://www.w3schools.com/sql/    ####










#=====================================================================#
#            74. Instructor Notes: CRUD, Scaffold, Wrap up            #
#=====================================================================#

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










#============================================#
#             SECTION 3 COMPLETE!            #
#============================================#