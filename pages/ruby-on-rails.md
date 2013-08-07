---
layout: page
title: "Ruby on Rails"
description: "Notes on Ruby on Rails"
---

{% include JB/setup %}

# Ruby on Rails

Working with Rails versoin 3.0.0 :

    $ sudo gem install -v 3.0.0 rails --include-dependencies
    $ rails _3.0.0_  new forum
    $ cd forum/
    $ bundle install
    
Generate model

     rails generate model files name:string type:string

Generate migration

     rails generate migration add_full_name_to_customer
     rails destroy model Files
    
Generate controller

Add relationship

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
    

## Background jobs processing:

### Add delayed_jobs to Gemfile:

    gem 'delayed_job
    gem 'delayed_job_active_record'
    
    bundle install -V
    rails g delayed_job:active_record
    rake db:migrate db:test:prepare
    
    Delayed::Job.enqueue(ImportJob.new(4), :queue => 'import')
    Delayed::Job.enqueue(LexerJob.new(4), :queue => 'lexer')
    Delayed::Job.enqueue(IndexerJob.new(4), :queue => 'indexer')
    
### Now start jobs daemons:

    script/delayed_job --pid-dir=tmp/pids/import_queue  --queue=import  start
    script/delayed_job --pid-dir=tmp/pids/lexer_queue   --queue=lexer   start
    script/delayed_job --pid-dir=tmp/pids/indexer_queue --queue=indexer start
    
### To stop the daemons:

    script/delayed_job --pid-dir=tmp/pids/import_queue  --queue=import  stop
    script/delayed_job --pid-dir=tmp/pids/lexer_queue   --queue=lexer   stop
    script/delayed_job --pid-dir=tmp/pids/indexer_queue --queue=indexer stop
    
http://rubydoc.info/gems/delayed_job/3.0.0/file/README.textile

### Unicorn:

    http://unicorn.bogomips.org/examples/
    

## Active Record


* adding records

    m = Movie.create
    m.new_record? # true if record is not saved
    m.id # nil if record is not saved
    
* finding records

    Movie.where("rating = 'PG'")
    Movie.find(3)
    .find_by_id(3)
    .find_all_by_rating('PG')
    .find_all_by_rating!('PG') # raises exception
    
* updating records


## TDD / BDD / RSpec / Cucumber / Capybara

    rails generate cucumber:install capybara
          create  config/cucumber.yml
          create  script/cucumber
           chmod  script/cucumber
          create  features/step_definitions
          create  features/support
          create  features/support/env.rb
          create  lib/tasks
          create  lib/tasks/cucumber.rake
    rails generate cucumber_rails_training_wheels:install
           exist  features/step_definitions
          create  features/step_definitions/web_steps.rb
           exist  features/support
          create  features/support/paths.rb
          create  features/support/selectors.rb
    rails generate rspec:install
          create  .rspec
          create  spec
          create  spec/spec_helper.rb
    rake spec
    rake cucumber
    

## Authentication

OmniAuth - https://github.com/intridea/omniauth/wiki

## Other unrelated stuff

### MongoDB and Ruby/Rails

For MongoDB - <http://nosql.mypopescu.com/post/1378460012/mongodb-and-cap-theorem>

    db.collectoion.getIndexes()
    db.collection.ensureIndex({column_name:1})

Indexes in MongoDB <http://www.mongodb.org/display/DOCS/Indexes>

Atomic operations in MongoDB <http://www.mongodb.org/display/DOCS/Atomic+Operations>

Mongoid and Rails

    bundle exec rake db:mongoid:create_indexes
