#========================================================================#
#            Section 7. Many-To-Many Associations and Testing            #
#========================================================================#










#===============================================#
#            177. Intro to Section 7            #
#===============================================#

# Section 7 will cover to main topics
#   Many-to-many associations
#   Automated Testing (unit, functional, integration)

# The feature we will be adding to help learning these is a categories feature

# Many-to-many associations
#   These are associations where an entry from one table can have an association 
#    with multiple entries with another table and vice verse
#   For our example of articles and categories
#     An article can have multiple types of categories associated with it
#      like news and tech or medicine and sports
#     The database of categories can also have many articles associated with each category
#      There could be hundreds of articles made about tech or sports
# 
# To handle these associations we are going to use a third table that will act as an inbetween for articles and categories
# Like each article has an id, each category will also have it's own id
# The third table will have a row that links 1 article id with 1 category id
# There can be multiple entries for each article since they can have multiple categories
# There can be multiple entries for each category since they can describe many different articles
#
#   articles table         article_categories table             categories_table
#   | article_id |      | article_id | category_id  |      | category_id | category |
#       1                     2           3                     1           news
#       2                     2           1                     2           sports
#       3                     1           3                     3           tech
#
#  With the tables and relationships above you can see that article 2 has both news and tech category
#  You can also see that both articles 1 and 2 are tech articles

# Automated testing
#   Testing is used to make sure that our app behaves the way it is supposed to
#   There are 3 types of tests we will be using
#   
#   Unit tests
#     Models, individual units of the application (like a validation) are working
#
#   Functional tests
#     Controllers, a function is working.
#     Ex. is before_action stopping a non-logged in action that shouldn't require login?
#
#   Integration tests
#     Full features, start to finish of a business process
#     EX. a user signing up for an app















#=======================================================#
#            178. Category Model and Testing            #
#=======================================================#

# We will start bulding the category model but first we are going to build the test for it

# The default testing library with rails is called minitest (what we will use)
#   More info here: https://guides.rubyonrails.org/testing.html#available-assertions

# If you look in your application directory you will see a folder called test
# It contains folders for different tests (channels, controllers, integrations etc)
#
# We want to create a test for a categories model
# So we want to create a new test file in the models folder called category_test.rb
# Inside this new file:
#   require 'test_helper'
#  
#   class Categorytest < ActiveSupport::TestCase
#  
#   end

# To use this new test in our terminal (make sure you are in alpha-blog directory)
#   $rails test
#
#   This will run all of our tests within the test folder
#   This is really helpful because if you add expansive testing
#    you can make sure your entire app is working as intended at once

# Now let's add a test inside of the class we created
#   test "category should be valid" do
#     @category = Category.new(name: "Sports")
#     assert @category.valid?
#   end
#
# What does this do?
# This creates a new test for rails to run called "category should be valid"
# This test will create a new @category instance variable
# It will assign @category the a new Category object (like a row in our table)
# Then it runs assert on @category
# Assert will test whether a give arguement is true
# So if @category.valid? returns true then assert will return true
# In other cases we could test that 2 variables or values are the same
# We can also run methods in it (like above) and assert will return whether the method returned the expected result

# Now run our test again
#   $rails test

# We will see that we got an error returned:
#   Error:
#   Categorytest#test_category_should_be_valid:
#   NameError: uninitialized constant Categorytest::Category
#       test/models/category_test.rb:6:in `block in <class:Categorytest>'

# We got this error because this model doesn't exist so @category cannot create an object and is invalid and fails the test

# Now we can write the minimum required code to get this test to pass
# This is called test driven development (or test first development)
# This can help ensure that you are only adding what is necessary and can help reduce debugging time

# Now let's write enough code to make this pass
# We will have to create a new model to make this test pass
# So in models create the file category.rb
#   class Category < ApplicationRecord
#  
#   end
#
# Just like all other models start
# Now we should have just enough code to make the error we ran into go away
# Save and run test again

# Now we get the following error
#   Error:
#   Categorytest#test_category_should_be_valid:
#   ActiveRecord::StatementInvalid: Could not find table 'categories'
#       test/models/category_test.rb:6:in `block in <class:Categorytest>'
#
# So now we have to create a users table

# Create a migration file as normal
#   $rails generate migration create_categories

# Inside the migration file that was made we can see that there is already a method to help create the table
# We just have to fill it out with the columns it needs 
#   t.string :name
#   t.timestamps

# Now run the migration file
#   $rails db:migrate

# We can see the table was made in the schema file

# Now try our test again

# Now our test passes!
# An object with a name of sports would be valid to add to the table

# One thing to keep in mind is that our tests don't run on our development databse
# They run on their own test databse 
# You can see that in the db folder there are several test.sqlite files
# You don't have to worry about these databases because after our tests are run they are scrubbed

# We can even verify our test by using rails console
#   $Category.all
#   $category = Category.new(name: "Sports")
#   $category.verify?
#   =>true

# Next we will write some validations and tests to test those validations










#=========================================================================#
#            179. Instructor Notes: Category Model and Testing            #
#=========================================================================#

# Code changes made during the previous video can be found here 
# (please ignore changes to the schema file which happen automatically once the migration file runs): 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/8f207aa1d5f7239aea7aff88ee07fd171451cfce

# Summary of changes:

# - Created category_test test file and wrote a test to check for the validity of a newly created category object

# - Ran failing test

# - Added category model

# - Added categories table

# - Ran passing test















#=============================================================#
#            180. Validations and Using Unit Tests            #
#=============================================================#

# Now we  are going to define some validations for our category model
# Since we want to practice test first development we are going to start
#  with writing the tests for each validation before defining the validation
#
#   test "name should be present" do
#      
#   end
#  
#   test "name should be unique" do
#    
#   end
#  
#   test "name should not be too long" do
#    
#   end
#  
#   test "name should not be too short" do
#    
#   end

# These are the tests we will be running on the name to ensure that our system only accepts valid category names
# If we make our tests correctly any invalid values will throw an error

# Let's fill out these tests
# For "name should be present":
#   @category = Category.new(name: " ")
#   assert_not @category.valid?
#
# Now instead of testing for true this will test for false
# We want to write our validation so that a name must exist and can't just be blank
# So we want to make sure that .valid? returns false which
# If it does then assert_not will say that everything is functioning correctly since a blank string was not valid

# If we run our tests we will get the following error:
#   Failure:
#   Categorytest#test_name_should_be_present [/home/jthomp/Dev/RubyOnRails2/ruby_projects/rails_6_projects/alpha-blog2/test/models/category_test.rb:12]:
#   Expected true to be nil or false

# This means that the blank name was valid when it shouldn't have been

# Let's add validation so this category model so that a blank username would be invalid
# Just like with previous models:
#   validates :name, presence: true

# Now try the test again

# The username should be invalid which means there were no errors returned

# Notice that we had to set the value of the @category instance variable again even though we already did in the first test
# That's because all objects are scrubbed after each test is run 
# Instead of having to set @category every time there is a special method we can add called setup
# Whatever is put in the setup method will run before each test
#
# Add the setup method above the tests and move the: $category = Category.new(name: "Sports") into setup
#  make sure to remove it from any other methods it is in
# 
# Then when we test for "name should be present" we can use
#   @category.name = " "
#
# Since @category had name set to sports in the setup method

# Now on to the next test
# We will enforce the uniqueness of each categories name
# To test for this we have to save the in memory @category from setup to the Category table
#  Remember this gets saved in the test db not the development db
# First we will save the current @category variable
# Then create a new object with the same name as @category
# Then we can check the validity
# If it is invalid then our test passes so we have to use assert_not
# Should look like this:
#   test "name should be unique" do
#     @category.save
#     @category2 = Category.new(name: "Sports")
#     assert_not @category2.valid?
#   end
#
# If we run the test it will fail because @category2 is valid and assert_not was expecting false
# See the following error:
#   Failure:
#   Categorytest#test_name_should_be_unique [/home/jthomp/Dev/RubyOnRails2/ruby_projects/rails_6_projects/alpha-blog2/test/models/category_test.rb:21]:
#   Expected true to be nil or false

# So let's add some validation that test for uniqueness
# We can do this slightly differently than other models with the following line:
#   validates_uniqueness_of :name
#
# Now when we run our test we shound't have any errors because our uniqueness works and @category2 was not valid, which is exactly what the test expects

# Now we will create a test for "name should not be too long"
# We will set the @category.name to be > 20 characters long
# Then we can check an assert_not to see if @category is valid with it's length
# Looks like this:
#   test "name should not be too long" do
#     @category.name = "a" * 21
#     assert_not @category.valid?
#   end
#
# Go ahead and do the same for "name should not be too short" but sub out the number to be less than 3
#
# Now running the test we will get 2 errors like we have been
# Now we will go add validation so that the our test will return invalid
# Update the validates line in the model:
#     validates :name, presence: true, length: { minimum: 3, maximum: 20 }

# Now if we run our tests they all pass










#=======================================================================#
#            181. Instructor Notes: Validations - Unit Tests            #
#=======================================================================#

# Code changes made during the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/50fcd16273f5295f4ef7c92ef7019115f6f06e7f

# Summary of changes:

# - Added unit tests for various category model validation specs.

# - Added validations to the category model to make the tests pass.















#============================================================#
#            182. Categories Controller and Tests            #
#============================================================#

# Now we will work on the categories controller and the tests for them

# These will be functional tests
# We want to test the individual actions of the controller
# In this controller those actions will be:
#   new
#   show
#   categories index

# So for our controller tests we would want to check that we are able to access these routes\
#   new
#     make sure we are able to access the new form (new.html.erb)
#   show
#     make sure we are able to view an individual category (show.html.erb)
#     This should show articles of that category when we get to that
#   categories index
#     list of all categories (index.htlm.erb)

# So first we need to generate a controller test for our categories controller
# We can use a generator that is a basic test of all the restful routes available to a resource
#   $rails generate test_unit:scaffold category
#
# Now there are 2 new files  
# The one we care about is test/controllers/categories_controller_test.rb

# This has all the restful routes tests prefilled for us so we can delete the ones we don't need
#  (otherwise our tests will fail)
# We only need: new, show, categories index
#
# We are also going to change the code in the setup method
# We want to make another @category instance variable in setup
# However instead of just having it be an object we want to actually save it to the database
# setup method should look like this:
#   setup do
#     @category = Category.create(name: "sports")
#   end
#
# Then we want to make sure we can access it and the database with our routes
# That's what these automatic methods do
# They use a get on the approrpriate route for each action the test is looking for
# Then it awaits a response
# If the response is success (the route was able to be accessed) then the test passes
#
# We don't need some of these tests so comment out any ones that are not new, index, or show

# Now we can run our tests
# Note that system tests (the other file generated earlier) will not run with $rails test
# We don't want to mess with that now and will be another command for later
# We can also test only the controllers folder with: (you can even specify a specific test)
#   $rails test test/controllers
#
# We can see that we have 3 errors, one for each of the tests we kept above

# Now we have to go add those routes to routes.rb so these tests pass
#   resources :categories, except: [:destroy]

# Now the issue is that we do not have a categories_controller
# So we will have to create one
#
# After creating app/controllesr/categories_controller.rb
# Add new, edit, and show methods
#
# Then we will have to create views for each of these methods
# Create these views and folder

# Now all of our tests pass










#==============================================================================#
#            183. Instructor Notes: Categories Controller and Tests            #
#==============================================================================#

# Changes made during the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/a3781eb86595560821d70e066496ae0b3b9307f2

# Summary of changes:

# - Generated a functional categories controller test file using the following command: 

# rails generate test_unit:scaffold category

# - Modified the file to only test for new, index and show urls for now.

# - Added the actions and templates so the tests pass, and in turn have the new, show and index templates ready to go.















#=====================================================#
#            184. Create Category and Test            #
#=====================================================#

# Now we will add the ability to create categories from the browser
#
# We will uncomment the "should create category" test from our categories_controller_test.rb
#   test "should create category" do
#     assert_difference('Category.count', 1) do
#       post categories_url, params: { category: { name: "travel" } }
#     end
# 
#     assert_redirected_to category_url(Category.last)
#   end
#
# What is it doing?
# First assert_difference is going to check the category count and see if it has changed by 1
# It is going to compare Category.count before and after it runs what is in the do block
# In the do block it posts a category with the params we provide
# Then it tries to access the newly created categories show page 
#
# Running this we get an error because a create method has not been made yet in the categories controller
# Add a create method to the controller

# Now if we run the test again we see that it still fails because the new item was not added 
# We have the create method but we aren't telling it how to submit the data like in articles controller

# Before we add that let's create the form that will be used to create a new category in categories/new.html.erb
# We can use the user login/edit profile form as a baseline and edit it as needed
# After changing the form to fit categories it should look like this:
#   <div class="container">
#     <div class="row justify-content-center">
#       <div class="col-10">
#         <%= render 'shared/errors', obj: @category %>
#         <%= form_with(model: @category, class: "shadow p-3 mb-3 rounded general-form", local: true)  do |f| %>
#           <div class="form-group row">
#             <%= f.label :name, "Category Name", class: "col-2 col-form-label" %>
#             <div class="col-10">
#               <%= f.text_field :name, class: "form-control shadow rounded form-input", placeholder: "Enter a category name" %>
#             </div>
#           </div>
# 
#           <div class="form-group row justify-content-center">
#             <%= f.submit class: "btn btn-success", id: "btn-submit-form" %>
#             <%= link_to 'Cancel and Return to Articles Listing', articles_path, class: "btn btn-primary" %>
#           </div>
#         <% end %>
#       </div>
#     </div>
#   </div>
# 
# We still have to initialize the @category variable in the categories_controller
# in the new method:
#   @category = Category.new
#
# Then we have to set up the create action to accept the input, create, and submit the new object
# This should be just like in the articles controller, except with categories:
#   def create
#     @category = Category.new(category_params)
#     if @category.save
#       flash[:notice] = "Category was successfully created"
#       redirect_to @category
#      else
#       render 'new'
#     end
#   end

# We also have to write the private category_params method just like in articles:
#   def category_params
#     params.require(:category).permit(:name)
#   end

# Now if we run our test it will pass and we should be able to save a category










#=======================================================================#
#            185. Instructor Notes: Create Category and Test            #
#=======================================================================#

# Code changes made during the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/f8f5d0d329b1220500286a26315f14fca776adcc

# Summary of changes:

# - Added functional test for create action.

# - Added the new category creation form.

# - Completed/added new and create actions in categories controller along with category_params private method.















#======================================================================#
#            186. Integration Test: Create Category Process            #
#======================================================================#

# We will write an integration test for the entire create categories methods we have built so far
# So far each of these methods are tested individually
# An integration test tests all of the methods together from end to end to make sure that a feature works correctly

# First let's generate the integration test
#   $rails generate integration_test create_category
#
# This will add a new file in test/integration
# Edit to run through the process of creating a new category
#   require 'test_helper'
# 
#   class CreateCategoryTest < ActionDispatch::IntegrationTest
#     test "get new category form and create category" do
#       get "/categories/new"
#       assert_response :success
#       assert_difference 'Category.count', 1 do
#         post categories_path, params: { category: { name: "Sports"}}
#         assert_response :redirect
#       end
#       follow_redirect!
#       assert_response :success
#       assert_match "sports", response.body
#     end
#   end
#
# What does this do?
# This will run a test where there is a get request to our url /categories/new
# Then it will look for a success response meaning the page was accessible
# Next it will use assert_difference to see if it able to successfully post a new category
# It is expecting the count of categories to increase by 1 by the time it is finished with the do block
# Inside the do block it posts a new category with the name we provide
# Then it expects to be redirected (post was successful)
# After that it will follow the redirect to see what page we land on 
# Then it looks for a success to know that the page was accessed
# Finally it looks for the category name we provided earlier within the html of returned page
#
# If all the above happens a new article was created and redirected the user to the show page of newly created category

# We will also have to render the @category.name in the show page so do the same as we did for the header of the user show page
#  adjust any variables as needed

# Lastly we will have to pass the @category variable into the show page within the show method in the controller
# We can do this the same way we have in other controllers with the following line:
#   @category = Category.find(params[:id])

# Now when we run our integration test it should work!










#==========================================================================#
#            187. Instructor Notes: Integration Test Create Cat            #
#==========================================================================#

# Code changes made in the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/fd0c4f8a2fee0adeef9a7058f25c139cf0eb6760

# Summary of changes:

# - Added create category integration test to test for the whole business process of creating a category (all steps involved up until this point).

# - Added some code to the show action/view to make the test pass.















#==================================================================#
#            188. Integration Test for Invalid Category            #
#==================================================================#

# Just like a valid submission we also want to test for invalid submissions

# We can use the test we already made as a baseline:
#   test "get new category form and reject invalid category submission" do
#     get "/categories/new"
#     assert_response :success
#     assert_no_difference 'Category.count' do
#       post categories_path, params: { category: { name: " "}}
#     end
#  
#     assert_match "errors", response.body
#     assert_select 'div.alert'
#     assert_select 'h4.alert-heading'
#   end
#
# This will open the new category page
# It will expect a :success response
# Then it will assert that what it is about to do should NOT change the number of objects in Category table
# Then it will try to submit an invalid name
# After that it will look to see if the page says error on it, if there is an alert div, and if we have the alert heading
# If those 3 things are on the page then the test will pass and will have successfully failed at adding a new category










#===========================================================================#
#            189. Instructor Notes: Integration Test for Invalid            #
#===========================================================================#

# Code changes made during the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/315889ae89d691ae3a85e93bc41c8c74d3d1a143

# Summary of changes:

# - Added integration test to test for invalid submissions made during the category creation process.















#==================================================================#
#            190. Listing Categories Int test + feature            #
#==================================================================#

# Now we will build our listing categories page and an int test for it
# We will also add pagination to this view like we have for other views

# We will start with the integration test
# Remember we can generate an integration test with: 
#   $rails generate integration_test list_categories
#
# Now what do we want to test?
# We want to create 2 categories
# We want to make sure these 2 created categories show on the categories index page
# We also want to make sure that the 2 created cards both link the their respective show pages 
# 
# To do that we can use the following:
#   def setup
#     @category = Category.create(name: "sports")
#     @category2 = Category.create(name: "travel")
#   end
#  
#   test "should show categories listing" do
#     get '/categories'
#     assert_select "a[href=?]", category_path(@category), test: @category.name
#     assert_select "a[href=?]", category_path(@category2), test: @category2.name
#   end
#
# The setup will create 2 data entries for our categories listing page
# Then then our test will fetch the categories listing page
# it will then see if there is a link that contains the path to one of the categories that we just selected
# Then we will see if the name of the object is also within that tag (it should be because the name is the link)

# If we run our test now it will fail because it cannot find a card that matches the link we provided

# We will have to build this in the categories index page
# Create this view (should have been created earlier)
#
# We can also use the articles listing page as a template and replace/add/delete as needed, but it should be fairly close
# We will also be using the _articles partial since that is rendered in the articles index page
# The index page should look like:
#   <h1 class="text-center mt-4">Categories</h1>
#  
#   <% @categories.each do |category| %>
#     <div class="row justify-content-md-center mt-4">
#       <div class="col-4">
#         <div class="card text-center shadow rounded">
#           <div class="card-body">
#             <h5 class="card-title"><%= link_to category.name, category_path(category), id: "card-title-text" %></h5>
#           </div>
#           <div class="card-footer text-muted">
#             <small>Created <%= time_ago_in_words(category.created_at) %> ago, edited <%= time_ago_in_words(category.updated_at) %> ago</small>
#           </div>
#         </div>
#       </div>
#     </div>
#   <% end %>
#
# If you understand the _articles partial you should understand what is happening here
# You will also remember that we have to initiate the @categories in the index action of the categories controller
# Add to the index method: (We will update to pagination later)
#   @categories = Category.all

# Now when we run our test they should pass

# Now we can add pagination
# First create at least 6 categories so that we can see if the pagination works correctly

# Then we can add pagination the same way we did to the articles controller
# Remember we have to change the line we just added in the controller so it does't select all categories
#   @categories = Category.paginate(page: params[:page], per_page: 5)
#
# Then we have to add the divs that show pagination above and below the things that will be displayed:
#   <div class="container">
#     <div class="apple_pagination">
#         <%= will_paginate @categories, :container => false %>
#     </div>
#   </div>
#  
#   < category card divs>
#  
#   <div class="container mb-4">
#     <div class="apple_pagination">
#         <%= will_paginate @categories, :container => false %>
#     </div>
#   </div>










#====================================================================================#
#            191. Instructor Notes: Listing Categories Int test + feature            #
#====================================================================================#

# Code changes made during the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/3e29dbf0ffa8aa77086365a3b1294714de19a3f2

# Summary of changes:

# - Added list categories integration test.

# - Completed categories index action with pagination.

# - Added categories index view.















#============================================================#
#            192. Admin User Requirement and Test            #
#============================================================#

# Now we want to restrict the create category page so that only admins can access it
# We want to make sure whoever is trying to access it is both logged in and an admin

# First let's modify the test in our controller test
#
# We are going to add a test
# "should not create category if not admin"
#
# We can use the "should create category" test as a template since it should be similar
# when finished it should look like this:
#   test "should not create category if not admin" do
#     assert_no_difference('Category.count') do
#       post categories_url, params: { category: { name: "travel" } }
#     end
#
#     assert_redirected_to categories_url
#   end
#
# Now run ONLY this test file

# This should fail since we haven't placed any restrictions on who can create categories yet
# The reason we wanted to only run the controller test is because once we fix our application
#  so that it passes then the integration test will fail because it does not have authorization 
#  to create a new category

# We are going to add this admin requirement in our categories controller
# To do this we are going to use a method called require_admin and use it as a before_action
#  for new and create actions
# Use the following for the before action:
#   before_action :require_admin, except: [:index, :show]
#
# Now we have to create the require_admin method
# This will be a private method
#   def require_admin
#     if !(logged_in? && current_user.admin?)
#       flash[:alert] = "Only admins can perform that action"
#       redirect_to categories_path
#     end 
#   end
#
# This will run before the new and create methods
# It will first test if someone is logged in && if they are an admin
#   If they are logged in and are an admin then nothing happens
#    the program will continue to the function that was originally called
#   If they are not logged in or they are not an admin
#     The user will see an error message saying only admins can do that

# Now if we run just the categories controller test again we will git 2 errors
# That's because these 2 methods don't have admin access when trying to get the new page and create method
# But the good news is the test we had written passed

# So now we need to simulate a logged in user so that these tests can pass
# To do this we will create an admin user in the setup method of the controller test 
#   @admin_user = User.create(username: "testadmin", email: "testadmin@email.com",
#    password: "testadminpass", admin: true)

# Now we have to log this user in for our test in new and create category
# We are going to add a new method to our test helper file called sign_in_as
# We will put it in the test helper so our other tests can access it as well
#   def sign_in_as(user)
#     post login_path, params:{ session: {username: user.username, password: "testadminpass"}}
#   end
#
# When called this will take a user arguement
# We will pass in the one created in the setup of the test
# Then it will post to the login path using the given session params just like a real login
# So there should be a session[:id] available to our methods when they are running
# Then when our test uses the controller methods to check if the user is logged in/admin 
#  they will run as expected

# We will have to add this method to our failed tests so they have a logged in admin user
#  that is made out of the user object created in setup

# Now if we run our category controller test they should all pass!

# But if we run all of our tests we get 2 failures in the integration test
# This is because these tests involve these new permissions and we never gave the tests an admin user

# So let's add the admin user and sign in method to our integration test
# We can do both of these within the setup method since both tests require an admin user (and should)
#   setup do
#     @admin_user = User.create(username: "testadmin", email: "testadmin@email.com",
#                               password: "testadminpass", admin: true)
#     sign_in_as(@admin_user)
#   end

# Now all of our tests pass

# We can test the new feature in the browser
# Try accessing the /categories/create page as both admin, logged out, logged in (non-admin)
# Everything works as expected!










#================================================================#
#            193. Instructor Notes: Admin Requirement            #
#================================================================#

# Code changes made during the previous video can be found here: https://github.com/udemyrailscourse/alpha-blog-6/commit/9106572e5d5be2922311e3f1ad40a0042449f6ae

# Summary of changes: 

# - Add controller test to ensure categories cannot be created by non-admins.

# - Add require_admin method (private) to categories controller and use it as before_action for new and create actions.

# - Create admin user in categories controller test and sign the user in for new and create action tests.

# - Build sign_in_as helper method to test_helper.rb file, so it can be used to sign users in for tests.

# - Modify categories integration test file to create and sign a user in (as admin) in order to proceed with the tests.















#==============================================#
#            194. Update Navigation            #
#==============================================#

# Now that we can make categories as an admin we want to add 2 new links to the navbar
#
# View Categories should be visibile to everyone, logged in or not
#   links to categories index
#
# Create Categories should only be visible to admin

# Go ahead and edit/style the navbar however you want
# This is how I did it:
#   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
#     <%= link_to "ALPHA BLOG", root_path, class: "navbar-brand", id: "logo" %>
#     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
#       <span class="navbar-toggler-icon"></span>
#     </button>
  
#     <div class="collapse navbar-collapse" id="navbarSupportedContent">
#       <ul class="navbar-nav mr-auto">
#         <li class="nav-item dropdown">
#           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
#             Browse Articles
#           </a>
#           <div class="dropdown-menu" aria-labelledby="navbarDropdown">
#             <%= link_to "View Articles", articles_path, class: "dropdown-item"  %>
#             <%= link_to "View Categories", categories_path, class: "dropdown-item" %>
#             <%= link_to "View Users", users_path, class: "dropdown-item"  %>
#             <% if logged_in? %>
#               <div class="dropdown-divider"></div>
#               <%= link_to "Create New Article", new_article_path, class: "dropdown-item"  %>
#               <% if current_user.admin? %>
#                 <%= link_to "Create New Category", new_category_path, class: "dropdown-item" %>
#               <% end %>
#             <% end %>
#           </div>
#         </li>
#         <% if logged_in? %>
#           <li class="nav-item dropdown">
#             <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
#               <%= current_user.username %> 
#               <% if current_user.admin? %>
#                 <span class="admin-title">[admin]</span>
#               <% end %>
#             </a>
#             <div class="dropdown-menu" aria-labelledby="navbarDropdown">
#               <%= link_to "View Profile", user_path(current_user.id), class: "dropdown-item"  %>
#               <%= link_to "Edit Profile", edit_user_path(current_user.id), class: "dropdown-item"  %>
#               <div class="dropdown-divider"></div>
#               <%= link_to "Logout", logout_path, class: "dropdown-item", method: :delete %>
#             </div>
#           </li>
  
#         <% else %>
#           <li class="nav-item">
#             <%= link_to "Login", login_path, class: "nav-link" %>
#           </li>
#         <% end %>
#       </ul>
  
#       <% if !logged_in? %>
#         <ul class="navbar-nav">
#           <li class="nav-item">
#             <%= link_to "Sign Up", signup_path, class: "nav-link" %>
#           </li>
#         </ul>
#       <% end %>
#       <form class="form-inline my-2 my-lg-0">
#         <input class="form-control mr-sm-2" id="nav-search" type="search" placeholder="Search" aria-label="Search">
#         <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
#       </form>
#     </div>
#   </nav>










#================================================================#
#            195. Instructor Notes: Update Navigation            #
#================================================================#

# Code changes made during the previous video to update the navigation partial can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/1e2954663604c4ca784e8f59ee1977750bb5c440















#=============================================================#
#            196. Many-to-many Association - Intro            #
#=============================================================#

# Articles will have the option to be associated with 1 or multiple categories
# Categories will have the option to associate many articles with them
#
# This is called a many-to-many association
#
# We will start with the 2 tables; categories and articles
# Then we will add a third table that will track the relationships betweent the 2
# This table will have 2 columns (besides id) called category_id and article_id
#
# If a category_id and an article_id are listed on the same row then they have a relationship with each other
# A given category_id or article_id can be listed multiple times on the table
#
# When we want to use this relationship to find out what categories an article is
#   The article_id will be searched for in the table
#   It will record the category_id associated with each listing of article_id
#   Then it will find the names of the categories associated with those id's
#   Then we will know what categories that article belongs to
#
# When we want to use this relationship to find out what articles a category has
#   The category_id will be serached for in the table
#   It will record the article_id associated with each listing of category_id
#   Then it will find the names of the articles associated with those id's
#   The we will know what articles belong to a given category

# How do we implement this in rails?
# We will use the has_many :through Association















#===================================================#
#            197. Many-to-Many - Backend            #
#===================================================#

# The first step to create the association between articles and categories
# We will have to create the article_categories table
# So let's generate the migration file 
#   $rails generate migration create_article_categories

# Now we have to define this new table in the migration file
# All we need in change method:
#   t.integer :article_id
#   t.integer :category_id
#
# Note we do not need to add timestamps but you can if you want

# Save the file and run migration
#   $rails db:migrate

# Now we have the new table
# We need to create the article/category model
# app/models/article_category.rb
# Simply create the class (remember it must inherit from ApplicationRecord)
#   class ArticleCategory < ApplicationRecord
#
#   end

# Now if we test in rails console
#   $ArticleCategory.all
#   $ArticleCategory
#
# We see the table and model are both working correctly so far but we haven't added any relationships

# In our article_category.rb model
# We will specify that this table belongs to both articles and article_categories
# We can do that like we did with articles when we said it belongs to users table
#
# In the class we just set up:
#   belongs_to :article
#   belongs_to :category
#
# That is all we need for the article_category model right now

# We still have to set up the article.rb model and category.rb model
# for article.rb
#   has_many :article_categories
#   has_many :categories, through: :article_categories
#
# for category.rb
#   has_many :article_categories
#   has_many :articles, through: :article_categories
#
# These 2 lines in all three models work together to form a link between articles and categories

# Now let's test it from the rails console
#   $Article.all
#   $article = Article.last
#   $article.categories
#   => [] # There are no categories associated but we can see that it is working

#   $Category.all
#   $category = Category.last
#   $cateogry.articles
#   => [] # No articles but we can see it works

# Now let's assign some articles to the category we have
#   $category.articles << article
#   $category.articles
#   => [article we just added]
#
#   $category.articles << Article.first
#   $category.count
#   => 2

# Let's see it from the other side and add some categories to an article
#   $article.categories << Category.first
#   $article.categories.count
#   => 2 # Because we assigned it to a category above










#=====================================================================#
#            198. Instructor Notes: Many-to-Many - Backend            #
#=====================================================================#

# Code changes made during the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/3e4de8083f4e019759408a7d1b33f052d97b5b42

# Summary of changes:

# - Create new migration file to add article_categories table with category_id and article_id columns.

# - Create article_category.rb model file and interact with the article_categories table.

# - Add the many-to-many association code using the relevant has_many through: association helpers in the article, category and article_category models.















#====================================================#
#            199. Add Association From UI            #
#====================================================#

# Now we are going to add the option to attach categories to articles when the article is created
# We are going to use a scrollable list of selectable options

# let's think of how we would do this in the console
#   $article = Article.new(title: "some title", description: "some description", user: User.last, category_ids: [1, 2])
#   $article.valid?
# 
# Notice that if you look at the article the categories aren't listed on it
# That is because that information is on another table and the article object we have is only referencing that row in the table
# Rails will interpret that reference with article.categories to list them but they are still seperate

#   $article.save

# When we do this in our app category_ids will be sent in from the article creation (or edit) form
# So that means we have to whitelist those parameters and add the new area to our form partial
#
# First article controller
# Let's whitelist the categories parameters
# The article_params method should now only have:
#   params.require(:article).permit(:title, :description, category_ids: [])

# Now both create and update should allow a category to passed through the form

# Now we have to deal with the form
# Let's look at the create an article page
# We will be using a new field called a select box
#   <div class="form-group row">
#     <%= f.label :category, class: "col-2 col-form-label" %>
#       <div class="col-10">
#         <%= f.collection_select(:category_ids, Category.all, :id, :name,
#         { prompt: "Make your selection from the list below (can be empty)" },
#         { multiple: true, size: 5, class: "custom-select shadow rounded" },) %>
#       </div>
#   </div>
#
# This will add a new area to our form with the label Category
# Then it will use bootstrap to add a custom-select class on our form collection_select field
# This field will use :category_ids to set the name and id attributes 
# Category.all tells it that these category_ids and names should come from the Category table
# Then it will set the value of each option (what is submitted) to :id
# :name is what gets displayed
# Then we use the prompt option
#   It allows us to set a string for the first option in the list
# Then we use multiple: true to confirm that the user can make multiple selections
# After that we set the size to 5 (shows 5 options at a time)
# Finally we add our bootstrap classes that are made for the html generated by collection _select

# Now if we test it out in the browser it won't display but we can see in console that the categories are assigned
#   $article = Article.last
#   $article.categories
#   => [whatever you assigned when you made the article]










#======================================================================#
#            200. Instructor Notes: Add Association From UI            #
#======================================================================#

# Code changes made during the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/d307ea65a16e93aa700fa6a691694cd82a38fca1

# Summary of changes:

# - White-list category ids in article_params method of the articles controller.

# - Add select box for categories to _form.html.erb (form partial) used for articles (views/articles/_form.html.erb).

# If you want to use checkboxes instead of the select box we used to display/select categories, 
# you can reference the code used in the Rails 5 version of the app here: 
# https://github.com/udemyrailscourse/alpha-blog-11-2017-5.1.4/blob/master/app/views/articles/_form.html.erb

# Note: If you do select this option to use the previous version using checkboxes, make sure you use the appropriate classes for styling from Bootstrap 
# (the version used in the repo is Bootstrap 3).















#===============================================================#
#            201. Update Article Views w/ Categories            #
#===============================================================#

# Last time we added the ability to add categories to an article when you create 
# Now we are going to display the assigned categories for an article anytime you are viewing an article
#   articles index
#   article show
#   user show list of articles

# We will start with the article show page 
# To show each category we can use a rails shortcut with render
# By saying render @article.categories 
#  rails will know that it should be adding html for each category associated with that article
#
# It will go look for a _category partial so we will need to create one in the views/categories folder
# Then we can use bootstrap badges to help style (pill badges)
# We can also turn these badges into a link by including them in an <a href> tag
#
# Add below gravitar in show page:
#   <% if @article.categories.any? %>
#     <div class="mt-2"><%= render @article.categories %></div>
#   <% end %>
#
# Add to newly created _category partial:
#   <%= link_to category.name, category_path(category), class: "badge badge-pill badge-success mr-1" %>
#
# I also added css to style the pills:
#   .badge-success {
#     background-color: #418e86;
#   }
#  
#   .badge-success:hover {
#     background-color: #37988e !important;
#   }

# Now let's do the same for the articles index page
# This page renders the _article partial
# So we will have to do the same thing as we did for index and add the following:
#   <% if article.categories.any? %>
#     <div class="mt-2"><%= render article.categories %></div>
#   <% end %>
#
# Note that @article was changed to article

# Now since the user page renders the article partial to show their articles
# The categories will also work on the user page










#=================================================================================#
#            202. Instructor Notes: Update Article Views w/ Categories            #
#=================================================================================#

# Code changes made during the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/ab486b0d10ede085cabe8e1ef30283b173863e54

# Summary of changes:

# - Added _category.html.erb partial to views/categories folder.

# - Added category display to article partial and articles show view by rendering the category partial.















#=============================================================#
#            203. Complete Category Index and Show            #
#=============================================================#

# Now we will add index and show pages for our categories

# Index will contain a listing of categories
# The show page will contain a list of articles with that category

# We want to add to the categories index page how many articles are in that category
#
# So we can use the line we used in the users card where it says how many articles they have
#
# Paste the following at the end of the card header for the categories index page
#   <p class="card-text"><%= pluralize(user.articles.count, "article") %></p>

# Now we can work on the show page
# We want to show all of the articles associated with a category
# We can use the user show page as a reference since it shows all of the articles belonging to a user 

# Edit what was in the users show to fit categories
# Should look like this:
#   <h1 class="text-center mt-4">Category: <%= @category.name %></h1>
#  
#   <% if logged_in? %>
#     <% if current_user.admin? %>
#       <div class="text-center mt-4">
#         <%= link_to "Edit category name", edit_category_path(@category), class: "btn btn-success" %>
#       </div>
#       <div class="text-center mt-4" id="show-btn-delete">
#         <%= link_to "Delete Category", category_path(@category), class: "btn btn-danger", method: :delete,
#         data: {confirm: "Are you sure you want to delete this category?"} %> %>
#       </div>
#     <% end %>
#   <% end %>
#   <h2 class="text-center mt-4">Articles</h2>
#  
#   <div class="apple_pagination container">
#       <%= will_paginate @articles, :container => false %>
#   </div>
#  
#   <%= render 'articles/article', obj: @articles %>
#  
#   <div class="apple_pagination container mb-4">
#       <%= will_paginate @articles, :container => false %>
#   </div>

# We also have to add the @articles instance variable so the page knows what list of articles to use
# This is done in the categories_controller: (show method)
#     @articles = @category.articles.paginate(page: params[:page], per_page: 5)










#=============================================================================#
#            204. Instructor Notes: Complete Category Index + Show            #
#=============================================================================#

# Code changes made during the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/e00a6dd9d51ebb5102d25cd5c23fbfbff63f8765

# Summary of changes:

# - Added display of number of articles associated with each category in the categories index listing.

# - Completed categories show view by using code from users/show view as starting template.

# - Initiated @articles instance variable in categories controller show action to capture all articles associated with a specific category.















#============================================#
#            205. Edit Categories            #
#============================================#

# Now we are going to add a way for admins to update names of existing categories

# We have a button but there is no edit action in our categories_controller
# Add edit and update methods to the controller
# These will look a lot like they did for articles and users
# Also note that these will only be admin accessible since we run the require admin method 
#   def edit
#     @category = Category.find(params[:id])
#   end
#
#   def update
#     @category = Category.find(params[:id])
#     if @category.update(category_params)
#       flash[:notice] = "Category name updated successfully"
#       redirect_to @category
#     else
#       render 'edit'
#     end
#   end

# For edit we will have to create a view as well
# We can use the new page and extract the form on it to a partial
# First setup the edit page to be like new page without the form
#   <h1>Edit Category Name</h1>
#   <div class="container">
#     <div class="row justify-content-center">
#       <div class="col-10">
#         <%= render 'form' %>
#       </div>
#     </div>
#   </div>

# Then create the _form partial and add the following:
# (remember to remove it from the new page and render this form there as well)
#   <%= render 'shared/errors', obj: @category %>
#   <%= form_with(model: @category, class: "shadow p-3 mb-3 rounded general-form", local: true)  do |f| %>
#     <div class="form-group row">
#       <%= f.label :name, "Category Name", class: "col-2 col-form-label" %>
#       <div class="col-10">
#         <%= f.text_field :name, class: "form-control shadow rounded form-input", placeholder: "Enter a category name" %>
#       </div>
#     </div>
#     <div class="form-group row justify-content-center">
#       <%= f.submit class: "btn btn-success", id: "btn-submit-form" %>
#       <%= link_to 'Cancel and Return to Categories Listing', categories_path, class: "btn btn-primary" %>
#     </div>
#   <% end %>
#
# Now our edit function should work in the browser










#==============================================================#
#            206. Instructor Notes: Edit Categories            #
#==============================================================#

# Code changes made during the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/309e5fae77e91ba7199f4fef7c8b28b2985f9e1a

# Summary of changes:

# - Added edit and update actions to categories controller.

# - Added edit.html.erb view template.

# - Added _form.html.erb partial under categories and extracted errors/form code from new.html.erb and added this partial.

# - Render form partial from both new and edit view templates.















#=======================================================#
#            207. Deploy to Prod and Wrap Up            #
#=======================================================#

# Now our application is finished!

# Let's deploy to production
# Make sure you have saved and commited everything first
#   $git push heroku master
#
# Then run migrations:
#   $heroku run rails db:migrate

# Now the app should be live and ready
# Make sure to add a category and assign it to an existing article

####  HOMEWORK  ####

# Create 2 integration tests
#   Users sign up process
#   New article creation process
#
# As a reference creating and listing categories can be used










#======================================================================#
#            208. Instructor Note: Deploy to Prod - Wrap up            #
#======================================================================#

# To deploy your app to heroku, first check git status to ensure you don't have any uncommitted code, if you do, make a commit.

# Then deploy to heroku:

# $ git push heroku master

# Then run any pending migrations in heroku:

# $ heroku run rails db:migrate

# Dont forget to post a link to your heroku app in the discussion area! This step is very important since others will get to see your app and get inspired/test.

# Homework assignment:

# 1. Create integration test for signing up a user.

# 2. Create integration test for creating a new article.

# You can reference the integration tests for creating and listing categories as a guide, post your tests to the discussions area or post a link to your GitHub repo.

# Congratulations on completing section 7!











#============================================#
#            Section 8. Complete!            #
#============================================#