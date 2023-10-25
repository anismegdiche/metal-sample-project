#!/bin/bash
mongoimport --drop  --db mflix --collection movies --file /mongodb-samples/movies.json
mongoimport --drop  --db mflix --collection users --file /mongodb-samples/users.json
mongoimport --drop  --db mflix --collection sessions --file /mongodb-samples/sessions.json
mongoimport --drop  --db mflix --collection comments --file /mongodb-samples/comments.json
mongoimport --drop  --db mflix --collection theaters --file /mongodb-samples/theaters.json