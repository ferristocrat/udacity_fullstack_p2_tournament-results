# Tournament Results
Udacity Full Stack Web Development - Project 2: Tournament Results
## Synopsis

This is my second of a series of projects through Udacity's **Full Stack Web Development** course, through which I have been learning Python and SQL.  For this project I have developed a database schema to store game matches between players.  Python is then used to rank players and pair them up in tournament matches.

## Files

* **tournament.py :** Contains installation of Swiss-style tournament
* **tournament.sql :** Database Schema
* **tournament_test.py :** Test cases for tournament.py

## Instructions

1. Install [Vagrant](http://vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/)
2. Clone this repository into vagrant folder
3. Launch the Vagrant VM
	1. Open shell and navigate to vagrant folder
	2. Type `vagrant up`
4. SSH into the Vagrant VM
	1. Type `vagrant ssh`
5. Navigate to the correct folder ie `cd /vagrant/tournament`
6. Open PSQL and initialize the tournament databse
	1. Type `psql`
	2. Type `\i tournament.sql`
	3. Type `\q` to leave PSQL
7. Run unit tests of tournament.py
	1. Run the python test script by typing `python tournament_test.py`