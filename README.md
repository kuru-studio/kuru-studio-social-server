# Kuru Studio Social (Server)
The server of Kuru Studio Social. Hosted on Heroku. You can access the server locally on port `3001`.

## Version
- Rails ~> 7.0.4.2
- Ruby ~> 3.2.1

## Set-up
You need to have **Docker** and **Docker Compose** installed on your machine to be able to run the following commands. You also need to setup the `config/master.key` before running the commands to make sure that everything will work fine.
```
# Open your default terminal and run the following
➜ docker-compose build                                                  # Builds the project
➜ docker-compose run web bin/setup                                      # Builds and populate the database
➜ docker-compose up                                                     # Starts the server
```

## Installing a new Gem
To install a new gem please edit the `Gemfile` and run the following commands afterwards.
```
# Open your default terminal and run the following
➜ docker-compose down                                                   # Stops the server
➜ docker-compose run web bundle install                                 # Run 'bundle install' inside the container
➜ docker-compose up --build                                             # Starts and rebuilds the project
```

## Testing the application
To test the application you can check the commands below. Be sure to set the database back to development once done testing!
```
➜ docker-compose run web rails db:create RAILS_ENV=test                 # Builds the test database if it doesn't exist
➜ docker-compose run web rails db:environment:set RAILS_ENV=test        # Set the database being used to "test"
➜ docker-compose run web rails test                                     # Run tests
➜ docker-compose run web rails db:environment:set RAILS_ENV=development # Set the database being used to "development"
```

## Extra commands
For other cases please check the commands below.
```
# Open your default terminal and run the following
➜ docker-compose run web rails db:migrate RAILS_ENV=development         # Run the migration
➜ docker-compose run web rails console                                  # Open the rails console
➜ docker-compose run web rake routes |grep 'test_courses'               # List routes with 'test_courses' in it
➜ docker ps                                                             # List all docker processes
➜ docker attach <CONTAINER_NAME>                                        # Attach to the application container (for when you're trying to use Debugger/Byebug)
➜ heroku run --app kuru-studio-social-server bash                       # Attach to the Heroku process
```

### Updating the environment credentials
Rails takes care of our credentials. To update them, please do the following.
```
# Enter bash inside the docker container
➜ docker-compose build                                                  # Builds the project
➜ docker-compose run web bash                                           # Enter bash inside the docker container
➜ EDITOR="vim" rails credentials:edit                                   # Edit the credentials inside the docker container using Vim
```
