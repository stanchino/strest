#web: bundle exec passenger start --sticky-sessions --port $PORT
#web: bundle exec rake websocket_rails:stop_server
web: bundle exec rails server thin -p $PORT
resque: env TERM_CHILD=1 QUEUE='apitest' bundle exec rake environment resque:work
#resque-scheduler: bundle exec rake resque:scheduler
