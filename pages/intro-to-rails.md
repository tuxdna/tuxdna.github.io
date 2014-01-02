---
layout: page
title: "Introduction to Ruby on Rails"
description: "Introduction to Ruby on Rails"
---

{% include JB/setup %}

# Ruby on Rails

What is Ruby on Rails?

A web application framework following MVC pattern, written in Ruby programming language.

## Prerequisites

You must be familiar with Ruby, basic Linux shell commands etc.

## Agenda

* Install
* Create a sample application
* Create a database for storing data
* Create some views
* Add some fancy stuff

## Lets begin

## Step 1: Installation

To install the Ruby on Rails framework:

    $ sudo yum install ruby rubygems
	$ sudo gem install -V -v 3.2 rails --include-dependencies

What is a gem?

Gem is a Ruby Package. To create your own Ruby Gem: http://guides.rubygems.org/make-your-own-gem/



Working with Rails versoin 3.0.0 :

    $ sudo gem install -v 3.0.0 rails --include-dependencies
	
## Step 2: Create a sample application

We are going to create a new application like this:

    $ mkdir ~/my-rails-applications/
    $ cd ~/my-rails-applications/
    $ rails _3.2.0_  new forum
      create  
      create  README.rdoc
      create  Rakefile
      create  config.ru
      create  .gitignore
      create  Gemfile
      create  app
      create  app/assets/images/rails.png
      create  app/assets/javascripts/application.js
      create  app/assets/stylesheets/application.css
      create  app/controllers/application_controller.rb
      create  app/helpers/application_helper.rb
      create  app/mailers
      create  app/models
      create  app/views/layouts/application.html.erb
      create  app/mailers/.gitkeep
      create  app/models/.gitkeep
      create  config
      create  config/routes.rb
      create  config/application.rb
      create  config/environment.rb
      create  config/environments
      create  config/environments/development.rb
      create  config/environments/production.rb
      create  config/environments/test.rb
      create  config/initializers
      create  config/initializers/backtrace_silencers.rb
      create  config/initializers/inflections.rb
      create  config/initializers/mime_types.rb
      create  config/initializers/secret_token.rb
      create  config/initializers/session_store.rb
      create  config/initializers/wrap_parameters.rb
      create  config/locales
      create  config/locales/en.yml
      create  config/boot.rb
      create  config/database.yml
      create  db
      create  db/seeds.rb
      create  doc
      create  doc/README_FOR_APP
      create  lib
      create  lib/tasks
      create  lib/tasks/.gitkeep
      create  lib/assets
      create  lib/assets/.gitkeep
      create  log
      create  log/.gitkeep
      create  public
      create  public/404.html
      create  public/422.html
      create  public/500.html
      create  public/favicon.ico
      create  public/index.html
      create  public/robots.txt
      create  script
      create  script/rails
      create  test/fixtures
      create  test/fixtures/.gitkeep
      create  test/functional
      create  test/functional/.gitkeep
      create  test/integration
      create  test/integration/.gitkeep
      create  test/unit
      create  test/unit/.gitkeep
      create  test/performance/browsing_test.rb
      create  test/test_helper.rb
      create  tmp/cache
      create  tmp/cache/assets
      create  vendor/assets/javascripts
      create  vendor/assets/javascripts/.gitkeep
      create  vendor/assets/stylesheets
      create  vendor/assets/stylesheets/.gitkeep
      create  vendor/plugins
      create  vendor/plugins/.gitkeep
         run  bundle install


Now we have almost everything setup. So, we will first make sure that our application is under source control. This way we can track code changes, and collaborate with other team members as well.

    $ cd forum/
    $ git init .
    Initialized empty Git repository in /home/tuxdna/my-rails-applications/forum/.git/
    $ git add .
    $ git commit -m "Initial commit"

If you get error with sqlite gem then do the following:

	$ sudo aptitude install libsqlite3-dev
	
	OR
	
	$ sudo yum install libsqlite3-devel
	
    $ bundle install


Gems required for a Rails application to run:

    $ bundle show

Gems included by the bundle:

     * actionmailer (3.2.0)
     * actionpack (3.2.0)
     * activemodel (3.2.0)
     * activerecord (3.2.0)
     * activeresource (3.2.0)
     * activesupport (3.2.0)
     * arel (3.0.3)
     * builder (3.0.4)
     * bundler (1.3.5)
     * coffee-rails (3.2.2)
     * coffee-script (2.2.0)
     * coffee-script-source (1.6.3)
     * erubis (2.7.0)
     * execjs (2.0.2)
     * hike (1.2.3)
     * i18n (0.6.9)
     * journey (1.0.4)
     * jquery-rails (3.0.4)
     * json (1.8.1)
     * mail (2.4.4)
     * mime-types (1.25.1)
     * multi_json (1.8.2)
     * polyglot (0.3.3)
     * rack (1.4.5)
     * rack-cache (1.2)
     * rack-ssl (1.3.3)
     * rack-test (0.6.2)
     * rails (3.2.0)
     * railties (3.2.0)
     * rake (10.1.0)
     * rdoc (3.12.2)
     * sass (3.2.12)
     * sass-rails (3.2.6)
     * sprockets (2.1.3)
     * sqlite3 (1.3.8)
     * thor (0.14.6)
     * tilt (1.4.1)
     * treetop (1.4.15)
     * tzinfo (0.3.38)
     * uglifier (2.3.3)
    

Now lets inspect what's already been generated for us.

### Inspect the development environment

Rails Console

    $ rails c

Start the application

    $ rails s

Now visit this URL: http://localhost:3000/

At this point we don't have anything configured in the application.

## Step 4: Preapare our data model

A typical Forum has following entities:

 * Topic
 * Post
 * User

Defining the relationships:

 * Topic has zero or more Post
 * Post is made by a User in a Topic
 * A User can create a new Topic

From which we infer that:

 * Topic **has many** Post
 * Post  **belongs to** Topic
 * User **has many** Post
 * User **has many** Topic
 * Topic **has many** Users ( via Post )

### Map our data model into Rails model

We can easily map our application model, into Rails models.

     rails generate model Topic name:string
     rails generate model User name:string userid:string password:String
     rails generate model Post content:text

Making modification to our application model:

     rails generate migration add_post_id_to_topic
     rails generate migration add_userid_to_topic
     rails generate migration add_userid_to_post

Fill in the migration code:

       def self.up
         add_column :post, :user_id, :integer
       end
     
       def self.down
         remove_column :post, :user_id
       end


We can also delete models

     rails destroy model Comments


Using bundle exec:

    $ bundle exec rails generate scaffold Topic name:string
    $ bundle exec rails generate scaffold Post name:string
    $ bundle exec rake db:migrate

    $ bundle exec rake routes

         posts GET    /posts(.:format)           posts#index
               POST   /posts(.:format)           posts#create
      new_post GET    /posts/new(.:format)       posts#new
     edit_post GET    /posts/:id/edit(.:format)  posts#edit
          post GET    /posts/:id(.:format)       posts#show
               PUT    /posts/:id(.:format)       posts#update
               DELETE /posts/:id(.:format)       posts#destroy
        topics GET    /topics(.:format)          topics#index
               POST   /topics(.:format)          topics#create
     new_topic GET    /topics/new(.:format)      topics#new
    edit_topic GET    /topics/:id/edit(.:format) topics#edit
         topic GET    /topics/:id(.:format)      topics#show
               PUT    /topics/:id(.:format)      topics#update
               DELETE /topics/:id(.:format)      topics#destroy
    
    $ bundle exec rails generate scaffold User name:string userid:string password:string
    
    
## Step 3: Setup a database

Make a MySQL database. However a SQLite database is already available.

## Step 4: Setup User Interface ( Views )

Create a session controller

    $ rails g controller sessions login home profile setting


Generate controller

Add relationship


### Add JQuery / JQuery UI 

Add jquery ui

Add to Gemfile: gem 'jquery-rails'

    $ bundle install
    $ rails g jquery:install
          remove  public/javascripts/prototype.js
          remove  public/javascripts/effects.js
          remove  public/javascripts/dragdrop.js
          remove  public/javascripts/controls.js
         copying  jQuery (1.7.1)
          create  public/javascripts/jquery.js
          create  public/javascripts/jquery.min.js
         copying  jQuery UJS adapter (822920)
          remove  public/javascripts/rails.js
          create  public/javascripts/jquery_ujs.js
    $ rails g jquery:install --ui
          remove  public/javascripts/prototype.js
          remove  public/javascripts/effects.js
          remove  public/javascripts/dragdrop.js
          remove  public/javascripts/controls.js
         copying  jQuery (1.7.1)
       identical  public/javascripts/jquery.js
       identical  public/javascripts/jquery.min.js
         copying  jQuery UI (1.8.16)
          create  public/javascripts/jquery-ui.js
          create  public/javascripts/jquery-ui.min.js
         copying  jQuery UJS adapter (822920)
          remove  public/javascripts/rails.js
       identical  public/javascripts/jquery_ujs.js
    

Understand how forms are generated using partials:

    <%= render 'form' %>
    

Foreign key:

    rails generate model ticket title:string description:text project:references
    
    before_filter
    update_attributes
    

## Rails Routes

Plain routes:

    resources :movies
    resources :movies
    

Nested Routes:

    resources :movies do
        resources :review
    end
    

    Rails.application.routes.url_helpers.edit_movie_path(movie)
    Rails.application.routes.url_helpers.similar_path movie


## Testing Rails Application

# References

 * http://net.tutsplus.com/tutorials/other/building-a-forum-from-scratch-with-ruby-on-rails/
 * http://stackoverflow.com/questions/16846088/rails-server-does-not-start-could-not-find-a-javascript-runtime
 * http://www.sitepoint.com/rails-userpassword-authentication-from-scratch-part-i/
 * http://www.sitepoint.com/rails-userpassword-authentication-from-scratch-part-ii/
 * http://stackoverflow.com/questions/17311940/rails-amazon-minitest-unit-loaderror

