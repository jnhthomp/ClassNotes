#==============================================================#
#       97. Install Bootsrap - Text Directions/References      #
#==============================================================#

# Install Bootstrap - Text directions, references and code
# Bootstrap sass gem page:

# https://github.com/twbs/bootstrap-sass

# Add the following gem to your gemfile above the gem 'sass-rails':

# gem 'bootstrap-sass', '~> 3.3.5'

# To install the gem to your app run:

# bundle install --without production

# Create a file called custom.css.scss under app/assets/stylesheets folder

# Add the following lines to the file:

# @import "bootstrap-sprockets";

# @import "bootstrap";

# Add the following line to your application.js file in the app/assets/javascripts folder under the line that says //= require jquery_ujs:

# //= require bootstrap-sprockets

# Make a commit to your git repo

























#===============================#
#       98. Build Homepage      #
#===============================#

# Time to style the homepage since it is pretty ugly right now



# First look at ~app/views/layout/application.html.erb
    # This is a wrapper file for all of the views in the application 
    # Where we see the <%= yield %> tag is where all of the html from the other views is injected 
    # You can see this by writting "Hello There!" above the yield and see that it shows on all pages
    # This means we can build a navigation partial (for organization) and render it in application.html.erb and it will show up on every page
    # To do this above the <%=  yield %> (and messages) tag enter the following
        # <%= render 'layouts/navigation %> 

# Now we can create the partial and it will show up in all pages 
# Create ~app/views/layouts/_navigation.html.erb
    # use getbootstrap.com (Drop down can be used to select correct version)
    # Go to components
    # Select navbar from side menu
    # copy/paste the html into _naviation.html.erb
# Now there is a good looking navbar!



# Lets style it by changing the colors and stuff
# In ~app/assets/stylesheets/custom.css.scss at top of the document MUST BE ABOVE IMPORT STATMENTS
    # Change background color:
        # $navbar-default-bg: #282a2e; 
    # Change the default selected link
        # Look in ~app/vies/layouts/_navigation.html.erb
        # Try to find the active class in the html where the list item is selected
        # Remove the active class
    # Change brand to Alpha Blog
        # Look in _navigation.html.erb
        # Find Brand in the list items and change it to Alpha Blog
    # Add styling to brand 
        # in brand div add id="logo"
        # in custom.css.scss at top of page 
            #   #logo { (# identifies an id)
            #       float: left;
            #       font-size: 1.7em;
            #       color: #03dac6;
            #       text-transform: uppercase;
            #       letter-spacing: -1px;
            #       font-weight: bold;} 
        # We can make it have new values when we hover
            #   #logo:hover {
            #       color: #eeffff;
            #       text-decoration: none;
            #   }
        # Add link to the brand text to home page
            # Replace the old brand div with the following:
                # <%= link_to "Alpha Blog", root_path, class: "navbar-brand", id: "logo"%>
    # Edit rest of navigation links to direct within the app
        # For Link nav bar item
            # Find it in the _navigation.html.erb
            # Convert it to embedded ruby
                # <li><%= link_to "Articles", articles_path %></li>
        # For dropdown menu (locatie in _navigation.html.erb)
            # Change name from "Dropdown" to "Actions"
            # Change first dropdown item "Action" to embedded ruby
                # <li><%= link_to "New Article", new_article_path %></li>

    # Edit main section of home page so it looks better
        # Create a jumbotron to put things on
            # This can be found in the bootstrap documentation similar to the navbar
            # Copy/paste into ~app/vies/pages/home.html.erb
                # <div class="jumbotron">
                #   <h1>Alpha Blog</h1>
                #   <%= link_to "Sign up now", "#", class: "btn btn-primary btn-lg" %>
                # </div>
            # This creates a jumbotron but it doesn't look very good because it stretches all the way across
            # To counter this we can put everything that is rendered in the <%= yield %> tag within a container that doesn't reach the edges of the screen
            # In ~app/views/layouts/application.html.erb place the yield tag in a div with "class container"
                # <div class="container">
                #   <%= yield %>
                # </div>
        # Center text in jumbotron
            # in home.html.erb add "center" class to jumbotron div
                # <div class="center jumbotron"> ...etc
            # in custom.css.scss
                # Create new class rule for center that specifies to center the text
                    #   .center {
                    #       text-align: center;
                    #   }

























#=====================================================#
#       99. Complete Homepage - Footer and Image      #
#=====================================================#

# Time to complete the homepage and add a footer and image to the page
# We can add an image to the jumbotron class with css
# First we have to save the image in our application
    # Images are stored in ~app/assets/images
    # Find an image, download it, and store it in the above folder
    # In custom.css.scss we can add the image and adjust other aspects of the jumbotron
        # .jumbotron {
        # 	background-image: asset-url("mountain.jpg");
        # 	background-size: cover;
        # 	height: 550px;
        # }

        # .jumbotron h1 {
        # 	color: #44bba4 !important;
        # 	background-color: #282a2e !important;
        # 	padding: 30px;
        # 	width: max-content;
        # 	border-radius: 1rem;
        # 	text-align: center !important;
        # 	margin: 15px auto;
        # 	letter-spacing: -1px !important;
        # 	font-weight: bold !important;
        # }
    # This can be played around with a lot and the sign up button can also be played with to make it look how we want

# Now we can add a footer and style it too

























#================================#
#       100. Teacher Notes:      #
#================================#

# Complete Homepage - Text directions and code
# After completion of the prior video, below is what the application.html.erb looks like:

# <!DOCTYPE html>

# <html>

# <head>

# <title>AlphaBlog</title>

# <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track' => true %>

# <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>

# <%= csrf_meta_tags %>

# </head>

# <body>

# <%= render 'layouts/navigation' %>

# <%= render 'layouts/messages' %>

# <div class="container">

# <%= yield %>

# </div>

# <%= render 'layouts/footer' %>

# </body>

# </html>

# The image to be added as background for the jumbotron should be added in the app/assets/images folder

# Below is what the custom.css.scss file looks like:

# $navbar-default-bg: black;

# @import "bootstrap-sprockets";

# @import "bootstrap";

# #logo {

# float: left;

# font-size: 1.7em;

# color: #fff;

# text-transform: uppercase;

# letter-spacing: -1px;

# font-weight: bold;

# }

# #logo:hover {

# color: #fff;

# text-decoration: none;

# }

# .center {

# text-align: center;

# }

# .jumbotron {

# background-image: asset-url('new_cover_page.png');

# background-size: cover;

# height: 550px;

# }

# .jumbotron h1 {

# color: #fff;

# text-align: center;

# margin-bottom: 30px;

# letter-spacing: -1px;

# font-weight: bold;

# }

# .btn-xlarge {

# font-size: 1.7em;

# background-color: black;

# }

# footer {

# margin-top: 45px;

# padding-top: 5px;

# border-top: 1px solid #eaeaea;

# color: #777;

# }

# footer a:hover {

# color: #222;

# }

# footer small {

# float: left;

# }

# footer ul {

# float: right;

# list-style: none;

# }

# footer ul li {

# float: left;

# margin-left: 15px;

# }

# Below is what the _navigation.html.erb file looks like:

# <nav class="navbar navbar-default">

# <div class="container-fluid">

# <!-- Brand and toggle get grouped for better mobile display -->

# <div class="navbar-header">

# <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">

# <span class="sr-only">Toggle navigation</span>

# <span class="icon-bar"></span>

# <span class="icon-bar"></span>

# <span class="icon-bar"></span>

# </button>

# <%= link_to "Alpha blog", root_path, class: "navbar-brand", id: "logo" %>

# </div>

# <!-- Collect the nav links, forms, and other content for toggling -->

# <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

# <ul class="nav navbar-nav">

# <li><%= link_to "Articles", articles_path %></li>

# <li><a href="#">Link</a></li>

# <li class="dropdown">

# <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Actions <span class="caret"></span></a>

# <ul class="dropdown-menu">

# <li><%= link_to "New Article", new_article_path %></li>

# <li><a href="#">Another action</a></li>

# <li><a href="#">Something else here</a></li>

# <li role="separator" class="divider"></li>

# <li><a href="#">Separated link</a></li>

# <li role="separator" class="divider"></li>

# <li><a href="#">One more separated link</a></li>

# </ul>

# </li>

# </ul>

# <form class="navbar-form navbar-left" role="search">

# <div class="form-group">

# <input type="text" class="form-control" placeholder="Search">

# </div>

# <button type="submit" class="btn btn-default">Submit</button>

# </form>

# <ul class="nav navbar-nav navbar-right">

# <li><a href="#">Link</a></li>

# <li class="dropdown">

# <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>

# <ul class="dropdown-menu">

# <li><a href="#">Action</a></li>

# <li><a href="#">Another action</a></li>

# <li><a href="#">Something else here</a></li>

# <li role="separator" class="divider"></li>

# <li><a href="#">Separated link</a></li>

# </ul>

# </li>

# </ul>

# </div><!-- /.navbar-collapse -->

# </div><!-- /.container-fluid -->

# </nav>

# Below is what the _footer.html.erb file looks like:

# <div class="container">

# <footer class="footer">

# <small>

# Copyright © <a href="enter in a link here">The Complete Ruby on Rails Developer</a>

# by <a href="enter in a link here">Mashrur Hossain</a>

# </small>

# <nav>

# <ul>

# <li><%= link_to "About", about_path %></li>

# </ul>

# </nav>

# </footer>

# </div>

























#=====================================#
#       101. Style Form Template      #
#=====================================#

# Continue styling app front end

# New and edit form styling
    # in ~app/views/articles/_form.html.erb added the bootstrap html as embedded ruby to generate a form
        # Needs form group use bottstrap col classes to set sizes
        # use rows: 10 to set height
        # For horizontal form you need to set the form-horizontal class (see arguements for form_for function)

























#===============================#
#       102. Techer Notes:      #
#===============================#

# Style Form Template - Text directions and code
# In the new and edit.html.erb files in the app/views/articles folder add the align center to h1 tags:

# <h1 align="center">Edit existing article</h1>

# <h1 align="center">Create new article</h1>

# Below is the current state of the _form.html.erb partial after styling the form portion:

# <% if @article.errors.any? %>

# <h2>The following errors prevented the article from getting created</h2>

# <ul>

# <% @article.errors.full_messages.each do |msg| %>

# <li><%= msg %></li>

# <% end %>

# </ul>

# <% end %>

# <div class='row'>

# <div class='col-xs-12'>

# <%= form_for(@article, :html => {class: "form-horizontal", role: "form"}) do |f| %>

# <div class="form-group">

# <div class="control-label col-sm-2">

# <%= f.label :title %>

# </div>

# <div class="col-sm-8">

# <%= f.text_field :title, class: "form-control", placeholder: "Title of article", autofocus: true %>

# </div>

# </div>

# <div class="form-group">

# <div class="control-label col-sm-2">

# <%= f.label :description %>

# </div>

# <div class="col-sm-8">

# <%= f.text_area :description, rows: 10, class: "form-control", placeholder: "Body of article" %>

# </div>

# </div>

# <div class="form-group">

# <div class="col-sm-offset-2 col-sm-10">

# <%= f.submit class: 'btn btn-primary btn-lg' %>

# </div>

# </div>

# <% end %>

# <div class="col-xs-4 col-xs-offset-4">

# [ <%= link_to "Cancel request and return to articles listing", articles_path %> ]

# </div>

# </div>

# </div>

























#================================#
#       103. Style Messages      #
#================================#

# Now to style validation errors that get shown
# Use panel and panel danger to contain the list of errors and pluaralize method to format the number of errors
























#================================#
#       104. Teacher Notes:      #
#================================#

# Style Messages - Text directions and code
# In your articles_controller.rb file change the flash[:notice] to be flash[:success], there should be 3 such occurances in that file

# Update your _messages.html.erb file with the following code:

# <div class="row">

# <div class="col-xs-10 col-xs-offset-1">

# <% flash.each do |name, msg| %>

# <div class='alert alert-<%="#{name}" %>'>

# <a href="#" class="close" data-dismiss="alert">×</a>

# <%= content_tag :div, msg, :id => "flash_#{name}" if msg.is_a?(String) %>

# </div>

# <% end %>

# </div>

# </div>

# Update your _form.html.erb at the top to remove the error portion and replace it with the following:

# <%= render 'shared/errors', obj: @article %>

# Create a folder called shared under app/views/ folder. Then within the shared folder file named _errors.html.erb to create the errors partial, then fill it in with the following code:

# <% if obj.errors.any? %>

# <div class="row">

# <div class="col-xs-8 col-xs-offset-2">

# <div class="panel panel-danger">

# <div class="panel-heading">

# <h2 class="panel-title">

# <%= pluralize(obj.errors.count, "error") %>

# prohibited this article from being saved:

# </h2>

# <div class="panel-body">

# <ul>

# <% obj.errors.full_messages.each do |msg| %>

# <li><%= msg %></li>

# <% end %>

# </ul>

# </div>

# </div>

# </div>

# </div>

# </div>

# <% end %>

























#=================================#
#       105. Style Show View      #
#=================================#

# Style Show View - Text directions and code
# Articles show page, show.html.erb:

# <h2 align="center">Title: <%= @article.title %></h2>

# <div class="well col-xs-8 col-xs-offset-2">

# <h4 class="center description"><strong>Description:</strong></h4>

# <hr>

# <%= simple_format(@article.description) %>

# <div class="article-actions">

# <%= link_to "Edit this article", edit_article_path(@article), class: "btn btn-xs btn-primary" %>

# <%= link_to "Delete this article", article_path(@article), method: :delete,

# data: { confirm: "Are you sure you want to delete the article?"},

# class: "btn btn-xs btn-danger" %>

# <%= link_to "View all articles", articles_path, class: "btn btn-xs btn-success" %>

# </div>

# </div>

# Add the following classes to custom.css.scss page:

# .article-actions {

# border-top: 1px solid #eaeaea;

# padding-top: 5px;

# }

# .description {

# margin-top: 0;

# }

























#=================================#
#       119. Style List View      #
#=================================#

# Now to add CSS for the list of all articles

# Style List View - Text directions and code
# Add styling to the index.html.erb page:

# <h1 align="center">Listing all articles</h1>

# <% @articles.each do |article| %>

# <div class="row">

# <div class="col-xs-8 col-xs-offset-2">

# <div class="well well-lg">

# <div class="article-title">

# <%= link_to article.title, article_path(article) %>

# </div>

# <div class="article-body">

# <%= truncate(article.description, length: 100) %>

# </div>

# <div class="article-actions">

# <%= link_to "Edit this article", edit_article_path(article), class: "btn btn-xs btn-primary" %>

# <%= link_to "Delete this article", article_path(article), method: :delete,

# data: { confirm: "Are you sure you want to delete the article?"},

# class: "btn btn-xs btn-danger" %>

# </div>

# </div>

# </div>

# </div>

# <% end %>

# Add the following code to the custom.css.scss page:

# .article-title {

# font-weight: bold;

# font-size: 1.5em;

# }

# .article-body {

# border-top: 1px solid #eaeaea;

# padding-top: 15px;

# padding-bottom: 15px;

# }

























#=========================================================#
#       120. Deploy to Production and Wrap Section 5      #
#=========================================================#

# Use heroku to deploy app 

# Check for uncommited changes
    # $git status

# Deploy to Heroku
    # $git push heroku master

# Run migrations
# This runs any migration files that have not been run in production
    # $heroku run rails db:migrate

# HOMEWORK ASSIGNMENT
    # Go to google and search "Active record associations"
    # Select guides.rubyonrails.org link
    # Read 2.3 "has many associations"

























#===============================#
#       121. Teacher Notes      #
#===============================#

# Deploy to Production - Text directions and references
# To deploy to heroku:

# git status # To ensure you have no uncommitted changes, if you do commit the code

# git push heroku master

# To run any un-run migration files in heroku:

# heroku run rake db:migrate

# Don't forget to post the link to your herokuapp link in the discussion area!

# Homework assignment to start section 6:

# Go to -> http://guides.rubyonrails.org/association_basics.h...

# and read about one-to-many (has_many) associations


























#======================#
#       . QUIZ 5:      #
#======================#

# What is bootstrap?
    # a pirate from the movies
    # a programming language
    # a collection of CSS and javascript libraries that make stylling classes available for use => true

# What is the bootstrap class to get a large rectangular gray box to display in the webpage?
    # large-gray-box
    # large-rectangular-box
    # jumbotron => true
    # jumbo

# How do you specify to use a form builder helper in a rails view?
    # <% form_tag
    # <% form_for
    # <%= form_for => true

