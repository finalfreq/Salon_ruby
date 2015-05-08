#Hair Salon

Are you considering moving your salon to an online platform? With this application it couldn't be any easier for you! The salon starter pro allows you to input the name of your current stylists and then add their clients into a database for storing all the information.

#PSQL

In order for this application to work you do need to run psql and create the following databases:
```
username=# CREATE DATABASE hair_salon;
```
```
username=# \c hair_salon;
```
```
hair_salon=# CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
```
```
hair_salon=# CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
```

For testing:
```
hair_salon=# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
```


## Installation


Retrieve the included Gemfile and Run the following command
```
bundle install
```

## Usage

To use the app run
```
ruby app.rb
```
Navigate in your browser to localhost:4567. Choose the link to add a stylist and update their information. Once you have a stylist added click the link to add a client. On the following page put in the client name and choose their stylist. You can then update or delete the client as well as change their stylist at any time.



### Bug reports

If you discover any bugs, feel free to create an issue on GitHub. Please add as much information as
possible to help us fixing the possible bug. We also encourage you to help even more by forking and
sending us a pull request.


## Maintainers
1. James Williams (https://github.com/finalfreq)



## License
MIT License. Copyright 2015
