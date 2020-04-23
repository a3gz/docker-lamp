This package provides a minimal setup to get a LAMP container running for learning purposes.

Clone this project

    git clone https://github.com/a3gz/docker-lamp.git

## docker-compose.yml

Some settings in `docker-compose.yml` need to be changed to prevent conflicts with existing Docker containers.

First change all occurrences of `myproject` for a name meaningful to your own project. 

    backend:
        container_name: myproject

    mysql:
        container_name: myproject-mysql

    adminer:
        container_name: myproject-dbadmin

Then change the local port numbers for Apache and Adminer

    ports:
        - 4114:80

Change `4114` for whatever port suits your needs.

    ports:
      - 4224:8080

Change `4224` for whatever port suits your needs.


## Build the container

Make sure you are inside the project's directory, from there run:

    docker-compose up --build -d

You are all set; open your browser and navigate to the following URL, changing `4114` with the port you used before.

    localhost:4114

