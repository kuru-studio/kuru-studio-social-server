FROM ruby:3.2.1
RUN apt-get update -qq && apt-get install -y vim postgresql-client
RUN mkdir /server
WORKDIR /server
COPY Gemfile /server/Gemfile
COPY Gemfile.lock /server/Gemfile.lock
RUN bundle install
COPY . /server

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
