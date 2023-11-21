#!/bin/bash
mongoimport --drop  --db mflix --collection movies --file /mdb-mflix-samples/movies.json
mongoimport --drop  --db mflix --collection users --file /mdb-mflix-samples/users.json
mongoimport --drop  --db mflix --collection sessions --file /mdb-mflix-samples/sessions.json
mongoimport --drop  --db mflix --collection comments --file /mdb-mflix-samples/comments.json
mongoimport --drop  --db mflix --collection theaters --file /mdb-mflix-samples/theaters.json