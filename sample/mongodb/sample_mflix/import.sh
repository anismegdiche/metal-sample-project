#!/bin/bash
mongoimport --drop  --db mflix --collection movies --file /mongodb-samples/movies.json
mongoimport --drop  --db mflix --collection users --file /mongodb-samples/users.json
mongoimport --drop  --db mflix --collection sessions --file /mongodb-samples/sessions.json
mongoimport --drop  --db mflix --collection ratings --file /mongodb-samples/ratings.json
mongoimport --drop  --db mflix --collection tags --file /mongodb-samples/tags.json