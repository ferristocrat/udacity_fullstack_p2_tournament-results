--
-- Table definitions for the tournament project.
--

-- Delete existing database titled 'tournament'
-- if one exists and create fresh database

DROP DATABASE tournament;
CREATE DATABASE tournament;
\c tournament;

-- Create a players table with two columns:
--		name: the player's full name (need not be unique)
--		id:  a unique identifier automatically assigned to each player

CREATE TABLE players (
	name TEXT, 
	id SERIAL PRIMARY KEY
);

-- Create a match table with four columns:
--		player1:  the id number of the first player
--		player2:  the id number of the second player
--		winner:  the id number of the player who won
--		match_id:  a unique identifier for each match

CREATE TABLE matches (
	player1 int REFERENCES players(id), 
	player2 int REFERENCES players(id), 
	winner int REFERENCES players(id),
	match_id SERIAL PRIMARY KEY
);

-- Create a standings view with four columns:
--		id: the player's unique id (assigned by the database)
-- 		name: the player's full name (as registered)
--		wins: the number of matches the player has won
--		games_played: the number of matches the player has played

CREATE VIEW standings AS
SELECT standings.id, standings.name, standings.wins, count.games_played
FROM (
	SELECT wins.id as id, players.name as name, wins.wins as wins
	FROM (
		SELECT id, count(winner) AS wins
		FROM players LEFT JOIN matches
		ON players.id=matches.winner
		GROUP BY id
		) AS wins
	JOIN players ON players.id=wins.id
	ORDER BY id ASC
	) AS standings
JOIN (
	SELECT players.id as id, count(matches.match_id) AS games_played 
	FROM matches RIGHT JOIN players 
	ON players.id=matches.player1 OR players.id=matches.player2 
	GROUP BY players.id
	) AS count
ON standings.id=count.id
ORDER BY standings.wins DESC;