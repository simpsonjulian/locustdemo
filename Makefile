app:
	bundle exec ./app.rb & 

test: app
	./bin/locust &
	sleep 10
	curl --data "locust_count=100&hatch_rate=10" http://localhost:8089/swarm
	sleep 60
	curl http://localhost:8089/stop
	curl -o output.csv http://localhost:8089/stats/requests/csv
	pkill -f locust
