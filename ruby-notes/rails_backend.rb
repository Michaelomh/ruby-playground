# Rails backend 

# Backend in Rails usually mean the model and the database. You can usually just use the scaffold generator to generate everything that you need. But it is good practice to start from scratch to understand what goes into building the backend of the application.

# Rails naming convention (for Article)

Model - article
  filename: article.rb
  className: Article
Table - articles
  title: string (256 char limit)
  description: text
 
To create a table, you need a migration file
Generate them using 
rails generate migration create_articles
# this would create an empty rb file with a table name of Article
# Now you should add all your table attributes inside

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
        t.string :title
        t.text :description
    end
  end
end

To run the migration files of the application
** Rails will only run migration files that has not been run already.

rails db:migrate
> This would create an article table in the Schema.rb



# Adding records to the database using the rails console
1. First you have to ensure that your model is set up accordingly. 
2. Make sure that you have the model and it is inheriting from ApplicationRecord

class Article < ApplicationRecord 

end

3. Go and open up the rails console by running: 
rails console
4. Here are some useful methods/commands in Rails Console

# CREATE
> Article.create(title: "first", description: "first description") # insert + commit
> article = Article.new(title: "second", description: "second desc") # insert 
> article.save # commit

# READ
> articles = Article.all # SELECT *
> article = Article.find(<id>) # SELECT * FROM ARTICLE WHERE id = <id>
> Article.last # get last entry of Article table

# UPDATE
> article = Article.find(<id>)
> article.description = "updated desc for 2"
> article.save

# DELETE
> article = Article.find(<id>)
> article.destroy

# Adding constraints to table. i.e. not null, 
# To get the list of constraints/validations
https://guides.rubyonrails.org/active_record_validations.html

In the models/article.rb
class Article < ApplicationRecord
  validates :title, presence: true # :title cannot be empty, NOT NULL
  validates :title, length: {minimum: 6, maximum: 100} # title need to have length between 6 to 100.
end

# To link from backend to frontend, you need a few things
# First you need to bring the data from the backend to the frontend via the Controller
# Second you need to show the data from the Contoller to the view 

# in articles_controller.rb
Class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end
end

 # in the view (show.html.erb)
 <%= @article.title %>
 <%= @article.description %>

 # to loop in the view
 <% @articles.each do |article| %>
  <li><%= article.title %></li>
  <li><%= article.description %></li>
<% end %>