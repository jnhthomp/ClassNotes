#=====================================================================#
#            Section 5. Styling For Your Rails Application            #
#=====================================================================#










#==================================================================#
#            104. Introduction to Section 5 and Styling            #
#==================================================================#

# This section will cover the styling of our application
# Currently we have built some functionality but it is really ugly and will not be efficient
#  especially when there is more and different types of data

# Let's make our page look nicer with 
# We can use bootstrap to apply styling quickly and nicely

# Let's talk about how html and css interact and are used
# HTML set's up what items will exist and how those items will be structured
# CSS defines what all the elements will look like and how they are positioned

# We will need an idea of what we want the page to look like
# We will want to "draw it" to give use a guide on what to build
# You can use a wireframing tool like draw.io or balsamiq















#===================================================#
#            105. Learn To Use Bootstrap            #
#===================================================#

# We are going to use bootstrap outside of a rails app just to get the hang of it

# Create a new file called index_1.html
# Now to add some basic html
#   (if using vscode use ! shortcut)

# With bootstrap keep in mind that there are 2 components you need to get started
# CSS
#   handles styling
#
# javascript
#   provides functions like drop down and collapsible menus

# We can install it locally in our machine but we don't have to.
# For this demo we can use a CDN which links data to our pages by accessing the web address provided

# The bootstrap website should have 2 sets of links available
# Copy and paste the tag for css inside the <head> tag of index.html
#
# Copy and paste the tags for js at the bottom of the <body> tag (just before </body>)

# Using bootstrap documentation go to components -> navbar to find out how we do it
# Copy and paste the provided code in their documentation into index.html (inside <body> tag)
# 
# If we save the sheet then we will have a working navigation bar
# The styling of the navbar comes from css
# The actions like drop downs are handled with js

# Next let's add a jumbotron
# Similar to the navbar, find the jumbotron component and copy it into our index.html
# Make sure to paste it below the navbar
#
# The only issue is this spans the width of the entire page
#  we would like some whitespace on the sides

# We can use a container to give margines to both sides (built in bootstrap thing)
# To create a container (class) use: (.container vscode emmet)
#   <div class = "container">
#     # jumbotron stuff goes in here
#   </div>

# Now there should be whitespace between the jumbotron and the edge of the page















#=============================================#
#            106. Install Bootsrap            #
#=============================================#

# More info at: 

# Now we can install bootstrap on our local machine
# That way we can be sure all of our elements and js work correctly and don't rely on a network connection

# First we need to expore how rails handles css and js
# looking at alpha-blog (rails 6)
# Comparing alpha-blog to a rails 5 application you can see that the js folders are stored in different places
# This is why the installation of bootstrap will depend on if you are using rails 5 or rails 6

# This will list rails 6 instructions
# If you look at application. 
# You can see the stylesheet_link_tag and the javascript_pack_tag in the <head> tag

# Because all of our views render on this page they will have available to them any stylesheets or js that is specified in the head
# That means we can add bootstrap and its css and js files to be able to incorporate it into our application

# To install bootstrap in rails 6
# We are going to use yarn to add bootstrap dependencies, jquery, and popper.js
# Yarn is already installed on wsl
#
# Run the following command in terminal: (In alpha-blog directory)
#   $yarn addbootstrap@4.4.1 jquery popper.js
#
# Now bootstrap should be installed

# You can verify it was installed by looking at package.json and seeing the yarn packages there.

# Now we can add some bootstrap elements to our project
# We can copy and paste the code from index.html to our home.html.erb (above flash message section at top of body)

# Save and run
# Why is it so ugly?
# We haven't linked the css yet

# In app/assets/stylesheets/application.css:
#   *= require bootstrap (top of page in comment block)

# Now it looks much better but the drop down menu doesn't work 
# The hamburger menu doesn't work either if you narrow the page
#
# We have to link the javascript to get these to work

# To link javascript 
# We have to make sure that the application understands jquery and popper.js
# We have to edit the config/webpack/environment.js file
# add the following lines below const { environment } = require('@rails/webpacker'):
#   const webpack = require("webpack")
#   environment.plugins.append("Provide", new webpack.ProvidePlugin({
#   $:'jquery'
#   jQuery: 'jquery',
#   Popper:['popper.js', 'default']
#   }))
#
# Then in the application.js we have to add:
#   import "bootstrap"

# Now our navbar should work as expected 

# We can make custom changes to our css by adding a new stylesheet
# Create a new file app/assets/stylesheets/custom.css.scss
# We will have to import bootstrap to this file in order to be able to edit bootstrap presets
#   @import 'bootstrap/dist/css/bootstrap';
#
# That will allow us to override bootstrap classes with our own css










#================================================================#
#            107. Instructor Notes: Install Bootstrap            #
#================================================================#

# You can find the blog post to add Bootstrap and it's dependencies in your application here: https://www.mashrurhossain.com/blog/rails6bootstrap4

# Remember to update version 4.3.1 to whatever Bootstrap version you want to use. (In the post it's 4.3.1, in the video I used 4.4.1)

# You can find all the code changes I made in this video here: https://github.com/udemyrailscourse/alpha-blog-6/commit/3cf2925664761c697c156ecf7687721086071adc

# You can ignore the changes in the package.json and yarn.lock files in the commit since they are done automatically during the installation process.

# The code added to make your app understand jquery and popper extensions in the config/webpack/environment.js file is listed below:

# const webpack = require("webpack")
# environment.plugins.append("Provide", new webpack.ProvidePlugin({
#   $: 'jquery',
#   jQuery: 'jquery',
#   Popper: ['popper.js', 'default']
# }))















#========================================================#
#            108. Install Bootstrap (Rails 5)            #
#========================================================#

# To add bootstrap in rails 5 you can use a bootstrap gem
# It is called bootstrap-rubygem
#
# Add the following to gemfile:
#   gem 'bootstrap', '~> 4.4.1'
#   gem 'jquery-rails'
#
# This will add bootstrap and jquery to our rails 5 projects
# Save this gemfile and run:
#   $bundle install
#
# Once complete there are a few more steps
# In app/assets/stylesheets/custom.css.scss
#   @import 'bootstrap';
#
# This will make bootstrap css available to our views in the layout file

# Now we have to go to assets/javascipts/application.js
# add the following lines: (Add below line that says //= require rails-ujs)
#   //= require jquery3
#   //= require popper
#   //= require bootstrap-sprockets (or //= require bootstrap)

# Now we should be able to add bootstrap elements to our views










#==========================================================================#
#            109. Instructor Notes: Install Bootstrap (Rails 5)            #
#==========================================================================#

# If you are using Rails 5 and want to install Bootstrap to your application, first add the Bootstrap and Jquery gems to your Gemfile:

# gem 'bootstrap', '~> 4.4.1'
# gem 'jquery-rails'
# Then run bundle install to install the gems in your app.

# Create a new file under your app/assets/stylesheets folder and call it custom.css.scss and fill it in with the following code:

# @import "bootstrap";

# Add the following 3 lines in your app/assets/javascripts/application.js file:

# //= require jquery3
# //= require popper
# //= require bootstrap
# To make it look like below:

# //= require rails-ujs
# //= require jquery3
# //= require popper
# //= require bootstrap
# //= require activestorage
# //= require turbolinks
# //= require_tree .
# You can test out your installation by using some bootstrap classes in your application.html.erb layout file. The navigation code used in the video is below:

# <nav class="navbar navbar-expand-lg navbar-light bg-light">
#   <a class="navbar-brand" href="#">ALPHA BLOG</a>
#   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
#     <span class="navbar-toggler-icon"></span>
#   </button>
 
#   <div class="collapse navbar-collapse" id="navbarSupportedContent">
#     <ul class="navbar-nav mr-auto">
#       <li class="nav-item active">
#         <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
#       </li>
#       <li class="nav-item">
#         <a class="nav-link" href="#">Link</a>
#       </li>
#       <li class="nav-item dropdown">
#         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
#               Dropdown
#         </a>
#         <div class="dropdown-menu" aria-labelledby="navbarDropdown">
#           <a class="dropdown-item" href="#">Action</a>
#           <a class="dropdown-item" href="#">Another action</a>
#           <div class="dropdown-divider"></div>
#           <a class="dropdown-item" href="#">Something else here</a>
#         </div>
#       </li>
#       <li class="nav-item">
#         <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
#       </li>
#     </ul>
#     <form class="form-inline my-2 my-lg-0">
#       <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
#       <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
#     </form>
#   </div>
# </nav>  
# You can also test out if you are able to modify existing bootstrap classes by using the following 3 tests:

# .navbar {
#   background-color: #FDF6EA !important;
# }  
  
# .navbar-brand {  
#   font-size: 3rem;
# }
  
# h1 {  
#   color: red;
# }














#===========================================#
#            110. Build Homepage            #
#===========================================#

# Now we are going to build or homepage and make it look nicer pages/home.html.erb

# We already applied a dark navbar when creating a navbar 
# Let's style the links and text colors
# Notice where we have the text there is class nav-link
# We can add the following to our custom.css.scss to change the color
#   .nav-link {
#     color: #03DAC6 !important;
#   }

# Now let's change the brand color (navbar-brand class in html)
# We can assign an id to this element by adding id="logo" in the div (before href attribute)
# Add the following css: (play around with it if you want)
#   #logo {
#     float: left;
#     font-size: 1.7em;
#     color: #BB86FC !important;
#     text-transform: uppercase;
#     letter-spacing: -1px;
#     font-weight: bold;
#   }

# So we don't clutter up our application.html.erb we can make our navbar into a partial
# Create a new file in layouts/_navigation.html.erb
# Replace <nav> tag, everything inside, and </nav> with:
#   <%= render 'layouts/navigation' %>

# Next we can work on the jumbotron
# First let's move the bootstrap jumbotron code into the view/pages/home/html.erb file
# Code to paste:
#   <div class="container">
#     <div class="jumbotron">
#       <h1 class="display-4">Alpha-Blog!</h1>
#       <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
#       <hr class="my-4">
#       <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
#       <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
#     </div>
#   </div>

# The container class gives us margins on the sides
# What if we want to add some space between the navbar and jumbotron
#  (vertical space)
#
# We can give the container an id and set custom css for it
# Change <div class="container"> to:
#   <div class="container" id="home-container">
#
# Then we can add some css for this id into our custom.css.scss
#   #home-container {
#     margin-top: 25px;
#   }
#
# Now we have that little bit of padding that we wanted

# Now let's center the text a little bit
# In bootstrap you can easily center text in an element with a built in bootstrap class
# The class is called text-center
# Adding this class to the most top jumbotron div will center all text in the jumbotron

# Now to add a background image
# You will have to find one at (unsplash.com)
# Download an image and add the image to:
#   app/assets/images
#
# Now we have to take the image and reference it in the jumbotron
# We can do this in custom.css.scss by adding a background-image attribute on the jumbotron class
#   .jumbotron {
#     background-image: asset-url('jumbotronbg.jpg')
#   }
#   
# The image shows up but it's really zoomed in
# We can edit the positioning with css
# in the css we just added include:
#   background-position: center center;
#   background-repeat: no repeat;
#   background-size: cover;
#
# To change the text color over the image we can add a text-white class to the jumbotron div (similar to the text-center)

# Now to add the footer
# We are going to use a sticky footer which will always stay at the bottom of the page
# Info for bootstrap sticky footer can be found with a google (flexbox is what is used here)
# Add the code below the jumbotron to make a footer:
#   <footer id="sticky-footer" class="py-4 bg-dark text-white-50">
#     <div class="container text-center">
#       <small>Copyright &copy; Your Website</small>
#     </div>
#   </footer>
#
# In order to keep the footer at the bottom of the page we have to add some css to force it down
# In custom.css.scss add the following:
#   html,
#   body {
#     height: 100%;
#   }

#   #page-content {
#     flex: 1 0 auto;
#   }

#   #sticky-footer {
#     flex-shrink: none;
#   }

# Then according to flex footer documentation we have to add d-flex and flex-column classes to the body tag (application.html.erb)
# We also have to add a div with id of page content in home.html.erb (jumbotron goes inside)
# Once that is done we should have a working footer










#=============================================================#
#            111. Instructor Notes: Build Homepage            #
#=============================================================#

# All the code changes made in the previous video to add Home page styling can be found here: 
#   https://github.com/udemyrailscourse/alpha-blog-6/commit/8f3ef132836225f566c705e6434ab39cc9c338b2

# You can skip the changes to the README.md file since that was just used in the video for display purposes.















#=================================================================#
#            112. Layout Links Using Bootstrap Classes            #
#=================================================================#

# Now that we added the navigation bar and jumbotron
#  we need to fix all of our navigatin links on our home page

# We want the Alpha Blog logo to go to the homepage
# In the _navigation.html we need to convert the Alpha Blog logo to rails code
# We can do that by using:
#   <%= link_to "ALPHA BLOG", root_path, class: "navbar-brand", id: "logo" %>
# This creates a link that displays "ALPHA BLOG" with a link to the homepage
# It also assigns this link a class of navbar-brand and id of logo
# This makes it perform the same actions and look the same as the original .navbar-brand tag
#  so we can get rid of the original

# Now let's do the same for the next link (Currently home)
# We are gong to make this a link to our articles index
#   <%= link_to "Articles", articles_path, class: "nav-link" %>

# Now edit the footer to have a link to the production version
# Edit current footer content to:
#   <small>Copyright &copy; <%= link_to "Current Production Version", "https://alpha-blog-jt2.herokuapp.com/", class: "text-white" %></small>










#===========================================================#
#            113. Instructor Notes: Layout Links            #
#===========================================================#

# All the code changes made in the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/404a3125e2bd8c28c461f20b99add19143dc616c















#======================================================#
#            114. Style Articles Index Page            #
#======================================================#

# Now to style the articles index page that lists our articles
# Each articles will be shown in their own box type display
# We will be mainly working in articles/index.html.erb

# We will be using a bootstrap element called a card
# Info can be found here: https://getbootstrap.com/docs/4.0/components/card/
#
# Copy the provided code (we are using "Featured")
#   <div class="card">
#     <h5 class="card-header">Featured</h5>
#     <div class="card-body">
#       <h5 class="card-title">Special title treatment</h5>
#       <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
#       <a href="#" class="btn btn-primary">Go somewhere</a>
#     </div>
#   </div>
#
# Put this into articles/index.html.erb below the header

# To get started lets center align the header
# Add a class of text-center to the <h1> element used for the header

# We want to change the card that we got to show article information
#   Featured --> Author name (not linked to articles yet)
#   Special title --> Article.title
#   card-text --> Article.description
#
# We also want to add 2 more buttons so there are 3 instead of just 1
# Buttons will be:
#   view
#   edit
#   delete
#
# Then we want to add 1 more text field underneath to show both the following:
#   article.created_at
#   article.updated_at

# let's start with displaying each article we have in the box
# We can grab the do block and put it around the card to generate 1 card for each article
# Then we just have to fill in the appropriate information like in the original table
# We can even use the same embeded ruby to fill in the info
# By now the card should look like:
#   <% @articles.each do |article| %>
#     <div class="card">
#     <h5 class="card-header">Featured</h5>
#     <div class="card-body">
#       <h5 class="card-title"><%= article.title %></h5>
#       <p class="card-text"><%= article.description %></p>
#       <a href="#" class="btn btn-primary"></a>
#     </div>
#   </div>
#   <% end %>
#
# We should be ok getting rid of the table that was displaying our articles now so delete that

# Now to add margins to both sides
# We could do this by using a container class around each of the cards but that is still wider than what we want
# We are going to try using bootstraps built in grid stystem to organize these using columns and rows
# The below code also shows that I added a footer using one of the card classes and added 2 extra buttons
#   <% @articles.each do |article| %>
#     <div class="row">
#     <div class="col-8">
#       <div class="card text-center">
#         <h5 class="card-header">Featured</h5>
#         <div class="card-body">
#           <h5 class="card-title"><%= article.title %></h5>
#           <p class="card-text"><%= article.description %></p>
#           <a href="#" class="btn btn-primary"> Button</a>
#           <a href="#" class="btn btn-success"> Button</a>
#           <a href="#" class="btn btn-danger"> Button</a>
#         </div>
#         <div class="card-footer text-muted">
#           2 days ago
#         </div>
#       </div>
#     </div>
#   </div>
#   <% end %>

# Now the cards are more narrow but they are aligned to the left of the screen
# All we have to do is add a class to each button to center it which bootstrap has built in
# Simply edit <div class="row"> --> <div class="row justify-content-md-center mt-4">
#   You can also add the class mt-4 above to give a 2 pixes top margin to each card

# To keep consistency across pages let's put the entire page in a #page-content div
#  This will ensure that background colors will stay the same
# We can then edit the #page-content in css to make changes sitewide

# Now let's make the cards look a little nicer by adding shadows
# This is another feature that bootstrap has built in and we can apply just by adding a class
# For a regular shadow you can must add the classes: (add to .card div)
#   .shadow .p-3 .mb-5 .bg-white .rounded 
#
# Now the div should look like: <div class="card text-center shadow mb-5 bg-white rounded">
#
# There should be a subtle shadow around each card now

# For the author we haven't linked the users database yet so we have to hard code it
# But we do want to italicize it so add the class .font-italic to the .card-header div (bootstrap built in)

# Moving onto the title
# We want it to show the title but we want it to also be a link to the article's show page
# Just add a link_to to embedded ruby where we call the article title
#    <h5 class="card-title"><%= link_to article.title, article_path(article), id: "card-title-text" %></h5>
#
# Play with the css to color the link and the rest of the card how you want

# Taking care of description
# We don't want the whole description to show up in the case that they are very long
# In order to take care of this we can use the truncate method when we call article.description
# This will allow us to shorten the description to a better length
#   <p class="card-text"><%= truncate(article.description, length: 100) %></p>

# Buttons
# We should link everything similar to how we had them lined in the table, except add the button classes:
#   <%= link_to "View", article_path(article), class: "btn btn-primary"%>
#   <%= link_to "Edit", edit_article_path(article), class: "btn btn-success" %>
#   <%= link_to "Delete", article_path(article), class: "btn btn-danger", method: :delete, data: {confirm: "Are you sure you want to delete this article?"} %>

# Footer
# We just have to but call the article.created and use the time_ago_in_words method
# Inside .card-footer:
#   <small>Created <%= time_ago_in_words(article.created_at) %> ago, edited <%= time_ago_in_words(article.updated_at) %> ago</small>

# Now that we are finished the whole index page should look like: 
# <div id="page-content">
#   <h1 class="text-center mt-4">Articles Listing Page</h1>

#   <p class="text-center"><%= link_to 'Create New Article', new_article_path %></p>

#   <% @articles.each do |article| %>
#     <div class="row justify-content-md-center mt-4">
#       <div class="col-8">
#         <div class="card text-center shadow mb-5 bg-white rounded">
#           <h5 class="card-header font-italic">by Jonah</h5>
#           <div class="card-body">
#             <h5 class="card-title"><%= link_to article.title, article_path(article), id: "card-title-text" %></h5>
#             <p class="card-text"><%= truncate(article.description, length: 100) %></p>
#             <%= link_to "View", article_path(article), class: "btn btn-primary"%>
#             <%= link_to "Edit", edit_article_path(article), class: "btn btn-success" %>
#             <%= link_to "Delete", article_path(article), class: "btn btn-danger", method: :delete, data: {confirm: "Are you sure you want to delete this article?"} %>
#           </div>
#           <div class="card-footer text-muted">
#             <small>Created <%= time_ago_in_words(article.created_at) %> ago, edited <%= time_ago_in_words(article.updated_at) %> ago</small>
#           </div>
#         </div>
#       </div>
#     </div>
#   <% end %>
# </div>

# Play around with classes in css to get any colors, borders, or shaping just right










#=======================================================================#
#            115. Instructor Notes: Style Article Index View            #
#=======================================================================#

# All the code changes made in the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/d5a5b696b3e75de45ee7179ce66525b94fe77fe9















#===============================================#
#            116. Style Form Partial            #
#===============================================#

# Now we are going to style the form partial so that both our new and edit forms both look nice
# The form should be contained to a card shape
# Card should have a background
# Button should say submit article
# Boxes should be big enough to add content

# First to center the heading
# Add the .page-content div around all the content in new.html.erb
# Add the .text-center class to the heading
# That should take care of the heading and background color for the page
#
# Then do the same for edit.html.erb

# Now we can start making changes to our form
# We are going to use .form-group and .row to organize our form
#
# We will put the title in one of the .form-group .row divs and the description in another
# That should let us get rid of the <p> tags that we were using before to seperate fields
# Add the following classes to f.label for our title: .col-2 .col-form-label
#
# Place the f.text_field for title nested in a div with .col-10 class
# Add the .form-control class to the f.text_field

# Now do the same as above for description
#
# The edit page should now have:
#   centered header
#   Form title label next to form title field
#   Form title field spanning the width of the page
#   Form description label next to form description field
#   Form description field spanning the width of the page
#
# Everything else should be untouched so far
# 
# Our form partial code should look like this:
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
#     <div class="form-group row">
#       <%= f.label :title, class: "col-2 col-form-label" %>
#       <div class="col-10">
#         <%= f.text_field :title, class: "form-control" %>
#       </div>
#     </div>
#
#     <div class="form-group row">
#         <%= f.label :description, class: "col-2 col-form-label" %>
#         <div class="col-10">
#         <%= f.text_area :description, class: "form-control" %>
#         </div>
#     </div>
#
#
#     <p>
#       <%= f.submit %>
#     </p>
#   <% end %>

# Right now the description field isn't tall enough
# Let's give it a few more rows to occupy by adding rows: 10 after text_area: :description

# Now let's style the update button and the link to cancel and return to the listing
# We can add the button to a new .form-group .row and add a class to style

# Next we can move the "Cancel and return to articles listing" from both the new and edit pages
# We can add these to the form partial so they are only in one place and it is easier to maintain consistency

# Now we are going to put the form in a container so it doesn't span the width of the whole page
# We are adding everything in _form.html.erb inside of this .container

# This looks fine but let's tighten everything up to be closer and center the 2 link buttons
# We can do that by wrapping the code in a .row class and justify content to be center of that and specify 10 rows 
# Add .row and .justify-content-center div around just the form

# Now we have to center the submit button
# We can add .justify-content-center class to the submit button div

# Add the shadow class we used for the cards to the form
# This goes in the form_with function between the article and local arguements
# You can also add an id to change the background color

# We can also add shadows to the text input boxes for title and description with .shadow .rounded classes

# Now to change the text color for the labels to white and add placeholder text to the input boxes
# We can do this by adding placeholder: "Placeholder content" in the text input areas

# Our final form partial code should look like: 
#   <div class="container">
#     <% if @article.errors.any? %>
#       <h2>The following errors prevented the article from being saved</h2>
#       <ul>
#         <% @article.errors.full_messages.each do |msg| %>
#           <li><%= msg %></li>
#         <% end %>
#       </ul>
#     <% end %>
#     <div class="row justify-content-center">
#       <div class="col-10">
#         <%= form_with(model: @article, class: "shadow p-3 mb-3 rounded", id: "create-article-form", local: true)  do |f| %>
#           <div class="form-group row">
#             <%= f.label :title, class: "col-2 col-form-label" %>
#             <div class="col-10">
#               <%= f.text_field :title, class: "form-control shadow rounded", placeholder: "Title of article" %>
#             </div>
#           </div>
#           <div class="form-group row">
#               <%= f.label :description, class: "col-2 col-form-label" %>
#               <div class="col-10">
#               <%= f.text_area :description, rows: 10, class: "form-control shadow rounded", placeholder: "Description of article" %>
#               </div>
#           </div>
#           <div class="form-group row justify-content-center">
#             <%= f.submit class: "btn btn-success", id: "btn-submit-form" %>
#             <%= link_to 'Cancel and Return to Articles Listing', articles_path, class: "btn btn-danger", id: "btn-cancel form" %>
#           </div>
#         <% end %>
#       </div>
#     </div>
#   </div>










#================================================================#
#            117. Instructor Notes Style Form Partial            #
#================================================================#

# All the code changes made in the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/49bb833ad4a20ed87fc1f028a92315b05ed0a011















#================================================================#
#            118. Style Validation and Flash Messages            #
#================================================================#

# Now let's make the validation messages look nicer
# We are going to put them in a container with a red background
# We are also going to add an "x" button so we can close the validation messages
#
# We also have an issue with our form where when we submit an invalid article it messes with our alignment
# This is because when there is an error rails automatically adds a field_with_errors class to the affected fields
#
# This will throw off our alignment so we want to keep that class from being added

# In order to keep that class from being added we need to add the following code to config/environment.rb:
#   ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
#    html_tag.html_safe
#   end
#
# This will get rid of the field_with_errors class that gets added
# 
# It is a good idea to restart your server anytime you change environment.rb because otherwise changes may not be reflected

# Now if we add an invalid article we can see that the alignment of the page is not messed up so it worked

# We can now tackle styling the flash messages
# These are shown in the _form.html.erb partial
# 
# First we are going to put flash messages in their own partial so that way we can use it to display other errors in other parts of our app later

# Create a new file app/views/shared/_errors.html.erb <-- Create folder/file
# Paste the if @article errors block into the _errors.html.erb partial
# Add: <%= render 'shared/errors' %> to the form partial to show error messages

# We can test that errors still work to be sure that we didn't break anything
#
# If everything is still good we can get onto styling the messages

# We are going to use bootstrap alerts to help us style easily
# Paste in the bootstrap template provided on their website above the errors code
# We will go through and transfer our code into the block
#
# When finished _errors.html.erb should look like:
#   <% if @article.errors.any? %>
#     <div class="alert alert-danger" role="alert">
#       <h4 class="alert-heading">The following errors prevented the article from being saved</h4>
#       <ul>
#         <% @article.errors.full_messages.each do |msg| %>
#           <li><%= msg %></li>
#         <% end %>
#       </ul>
#     </div>
#   <% end %>

# Now we have some style to our messages
# We can make it look a little nicer by setting it to match the width of the form box
# We also still want to add the dismiss class to the alerts so we can get rid of them
# To get it to match the width of the form we can simply move where the errors render (in _form partial)
#  to be inside of the .col-10 div

# Now to add the dismiss button
# To do that we can add the .alert-dismissable .fade-show to the div where we make the alert
# We also have to add the code for the button with:
#   <button type="button" class="close" data-dismiss="alert" aria-label="Close">
#     <span aria-hidden="true">&times;</span>
#   </button>

# Now what if we successfully update?
# We can style the "Article Created Successfully" message on the show page as well
# These are rendered in application.html.erb
# We can see that it is rendering a partial called _messages to show the successfully created alert
# So we have to add our alert styling to _messages.html.erb
# We will use the simpler alert class this time (alert notification is only one line)
# Paste the bootstrap code into _messages and fill with our data
# Also include the dismiss classes and button
# Place entire _messages content in a container to give margins










#=============================================================#
#            119. Instructor Notes: Style Messages            #
#=============================================================#

# To remove the field_with_errors functionality, add the following code to the bottom of the config/environment.rb file:

# ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
#   html_tag.html_safe
# end
# The code changes made in the previous video can be found here:
# https://github.com/udemyrailscourse/alpha-blog-6/commit/0cc39c1815eff9e591356066ed06f518ed7f9ec8















#============================================#
#            120. Style Show View            #
#============================================#

# Now to add some style to the individual articles show page
# We want to make it look like an individual card from the articles listing page

# so we can borrow code from the articles listing page and modify it as needed
# let's pull up both the show.html.erb and index.html.erb
# Copy all the code from index into show
# First change the heading to show the article title with <%= @article.title =>
# We need to change the @articles variable into @article in the show view
# We can get ride of the article title in the .card-body since we are already displaying it
# We don't need to truncate the description since this should show the whole article
#  remove the truncate function and length: 100 arguement
# Change the description article variable to @article
# We are already in the view page so we can remove the view button
# For edit and delete article path change the article variable to @article
# In the footer change the article variable to @article

# Now the problem is that the alert does not show up in the container and messes with the page layout
# We also have the problem that if someone uses multiple lines when writing the description the layout is not preserved
# For example:
#   Recipe 1: Ingredient 1,
#             Ingredient 2,
#             Ingredient 3
#       
# Becomes:
#   Recipe 1: Ingredient 1, Ingredient 2, Ingredient 3 
#
# To fix this we can pass @article.desciption into a method called simple_format
# We should also change that line from a <p> tag to a <div> tag
#  This will help with some of the padding above the content

# Our Final Code should look like:
#   <div id="page-content">
#     <h2 class="text-center mt-4"><%= @article.title %></h2>
#     <p class="text-center"><%= link_to 'Create New Article', new_article_path %></p>
#     <div class="row justify-content-md-center mt-4">
#       <div class="col-8">
#         <div class="card text-center shadow mb-5 bg-white rounded">
#           <h5 class="card-header font-italic">by Jonah</h5>
#           <div class="card-body">
#             <div class="card-text"><%= simple_format(@article.description) %></div>
#             <%= link_to "Edit", edit_article_path(@article), class: "btn btn-success" %>
#             <%= link_to "Delete", article_path(@article), class: "btn btn-danger", method: :delete, data: {confirm: "Are you sure you want to delete this article?"} %>
#           </div>
#           <div class="card-footer text-muted">
#             <small>Created <%= time_ago_in_words(@article.created_at) %> ago, edited <%= time_ago_in_words(@article.updated_at) %> ago</small>
#           </div>
#         </div>
#       </div> 
#     </div>
#   </div>










#==============================================================#
#            121. Instructor Notes: Style Show View            #
#==============================================================#
# The code changes made in the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/c3f31aec3264d65db8eb9814fbd6efed70c83e75















#=========================================================#
#            122. Cleanup Layout - Prod Deploy            #
#=========================================================#

# There are just a couple more finishing touches
# First is the footer
# Right now it only shows up on the homepage but we want all pages to have a footer

# We can make it a partial and render it to the application.html.erb with:
#   <%= render 'layouts/footer %>

# Next we want to clean up the #page-content id that we have around everything
# Remove the #page-content div from all of the pages
# Instead at it to the application.html.erb file around the messages, and yield tags\

# Now let's clean up the navigation bar
# Instead of not using the drop down we can use it to store a create new article button
# Use an embedded ruby link_to method and add the appropriate classes to recreate the dropdown items
# Remove any unnecessary <li> items in the navigation bar that we are not using
# After modifying the navbar should look like:
#   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
#     <%= link_to "ALPHA BLOG", root_path, class: "navbar-brand", id: "logo" %>
#     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
#       <span class="navbar-toggler-icon"></span>
#     </button>
#  
#     <div class="collapse navbar-collapse" id="navbarSupportedContent">
#       <ul class="navbar-nav mr-auto">
#        
#         <li class="nav-item dropdown">
#           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
#             Articles
#           </a>
#           <div class="dropdown-menu" aria-labelledby="navbarDropdown">
#             <%= link_to "Create New Article", new_article_path, class: "dropdown-item"  %>
#             <div class="dropdown-divider"></div>
#             <%= link_to "View Articles", articles_path, class: "dropdown-item"  %>
#           </div>
#         </li>
#       </ul>
#       <form class="form-inline my-2 my-lg-0">
#         <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
#         <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
#       </form>
#     </div>
#   </nav>

# That's all the styling we wanted to do!

# Let's make a commit and deploy to production
# After making a commit and pushing to github:
#   $git push heroku master
#
# We didn't make any changes to our database but it is best practice to run this every production push:
#   $heroku run rails db:migrate










#=============================================================#
#            123. Instructor Notes: Cleanup Layout            #
#=============================================================#

# The code changes made in the previous video can be found here: 
# https://github.com/udemyrailscourse/alpha-blog-6/commit/3300be837f9591066e918cd700807018d7f1164c

# To deploy your application to heroku, first ensure you have checked git status and that all your changes have been committed to your git repo. 
# If there are untracked/uncommitted changes then follow the usual commit route:

# $ git add -A
# $ git commit -m "Appropriate commit message"
# $ git push origin master # to deploy to your GitHub or other code repo
# Then deploy your changes to heroku and run any pending migrations there:

# $ git push heroku master
# .....after deployment completes successfully....
# $ heroku run rails db:migrate










#==============================================#
#            Section 5. Complete!!!            #
#==============================================#