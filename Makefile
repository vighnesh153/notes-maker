install-client: ./client/package.json
	cd ./client && npm install

install-server: ./server/package.json
	cd ./server && npm install

install: install-client install-server

run-server: install-server run-docker
	cd ./server && npm start

run-client: install-client
	cd ./client && npm start

run-docker:
	docker-compose up

stop-docker:
	docker-compose down

clean:
	cd ./client && rm -rf node_modules
	cd ./server && rm -rf node_modules
	rm -rf ./data
