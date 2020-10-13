# Notes Maker

A personal notes maker. Host it on your favourite 
cloud provider to start making your own notes.

### Documentation
* [API](https://github.com/vighnesh153/notes-maker/blob/master/docs/API.md)
* [Database Architecture](https://github.com/vighnesh153/notes-maker/blob/master/docs/DB_Design.md)
* [UI Mockups](https://github.com/vighnesh153/notes-maker/blob/master/docs/UI_mock_ups.md)

### Development Setup
##### Pre-requisites
* Setup [nodejs](https://nodejs.org/en/)
* Setup [docker](https://docs.docker.com/engine/install/)
* Setup [docker-compose](https://docs.docker.com/compose/install/)
* Setup [make](https://www.google.com/search?q=install+make) tool
* Fork the repo
* Clone the repo on the system
---
##### Install dependencies
* `cd notes-maker`
* `make install`
---
##### Start server
* In a separate terminal instance
```
make run-server
```
---
##### Start client
* In a separate terminal instance
```
make run-client
```

##### Stop docker
```
make stop-docker
```

##### Clean project
```
make clean
```

