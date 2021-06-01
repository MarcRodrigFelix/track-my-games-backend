# Description

Welcome To Track My Games Backend. This is a web app for gamers with more than a few games to keep track of that they are currently playing. Just add the games your playing to your list and keep them until your finished. Then feel free to delete them or leave them as a record.

Download repo and try locally. Clone the repo and run 

    $ bundle install
  
  If required to run migration locally

    $ rails db:migrate

  Run seed data for testing

    $ rails db:seed

  Test data in rails console
    
    $ rails console
    $ rails c

  Run local server (JSON data from Backend API)
  
    $ make sure to run on localhost:3001
    $ rails server
    $ rails s



## Gems Used. 
  * rails, '~> 6.1.3', '>= 6.1.3.2'
  * sqlite3, '~> 1.4'
  * puma, '~> 5.0'
  * active_model_serializers, '~> 0.10.2'
  * bcrypt, '~> 3.1.7'
  * jwt
  * dotenv-rails
  * http
