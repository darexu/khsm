# Who wants to be a millionaire

The Application-game is based on the famous game "Who Wants to Be a Millionaire." 
The user is asked questions that he can answer.
Each correct answer takes the player to a new level and increases the prize.
The functionality of prompts "Call a friend", "Help from the hall", "50 to 50" is implemented.
In the application you can see the players' ratings.
Tests are made using the [factory_bot_rails](https://github.com/thoughtbot/factory_bot) gem.
Configured to work with Heroku, demo here [hhsm.herokuapp.com](http://hhsm.herokuapp.com)

Language Russian.

## Requirements

ruby '2.7.0'

rails '~> 5.1.4'

A complete list of gems used is specified in the Gemfile

## Getting started

Download or clone repo

Use bundler (skip gems needed only in production)
```
bundle install --without production
```

Run database migrations
```
bundle exec rails db:migrate
```

Fill your database with questions
```
bundle exec rails db:seed
```

Launch Rails server 
```
bundle exec rails s
```

Open `http://localhost:3000` in your browser
