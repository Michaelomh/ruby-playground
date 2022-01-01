# Rails

# What is a gem?
# gems = ruby libraries (e.g. rails is a gem)

# What are some gems that you should need for Rails development
sqlite3 (gem install sqlite3)
webpacker (gem install webpacker)
rails (gem install rails)

# To create a new rails application - run the following commands
rails new <name of application>
rails server # to startup application


# Rails follow the MVC design pattern 
Model-View-Controller
Model = User, Post, Article, Stock
View = home.erb, settings.erb, blog_post.erb
Controller = home_controller, settings_controller, blog_post_controller

# General flow of Rails application:
1. Request made at browser
2. Request received at router of rails application
3. Request routed to appropriate action in a controller
4. Controller # action either renders a view template or communicates with model
5. Model communicates with database
6. Model sends back information to controller
7. Controller renders view

# Directory
- app
  - assets > store all static assets (images, stylesheets)
  - channels > not impt
  - controllers > store all controllers
  - helpers > store all helpers classes for view templates
  - javascript > For all js stuff
  - jobs > not impt
  - mailers > not impt
  - models > store all model 
  - views > store all views
- bin > 
- config > store all configurations here
- db > store all database table
- lib > not impt
- log > not impt
- public > not impt
- storage > not impt
- test > for all tests
- temp > not impt
- vendr > not impt
Gemfile > similar to package.json, stores all gem files
Gemfile.lock > created when you do bundle install 
Rakefile > not impt

Models 
Controllers
Views /  layouts

# How to set routing in Rails
config > routes.rb

Rails.application.routes.draw do 
  # point route to the controller
  # root route is application_controller 
  # after the hashtag it is expecting to run method "home" in application_controller
  root 'application#home'
end

# Application_controller would help to specify what to render in the rails application
class ApplicationController < ActionController::Base
  def home
  end
end

-------------------------------------

# Rails allows you to auto generate your controller using
# It creates controller file, tests, helper files & scss styling.
rails generate controller <controller_name>

# To add in a new page 
1. Go to routes.rb, and point to the new location

# routes.rb
Rails.application.routes.draw do 
  root 'pages#home'
  get 'about', to: 'pages#about'
end

2. Go to pages_controller.rb and add a new method
class PagesController < ApplicationController
  def home
  end
end

3. Add a .html.erb in your view with the same method name and add HTML code here.
# view/pages/home.html.rb

-------------------------------------

# Rails also allows you to generate scaffold. scaffolds are creating an entire Page - i.e table, model, controller, view.

rails generate scaffold <Scaffold_name> <table attributes>
rails generate scaffold Article title:string description:text

# Communicating with the backend (model <-> Database)
Rails uses a middle man to do CRUD operations from Rails application to the database. This is called ORM (Object Relational Mapper) called ActiveRecord.

