-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament

-- DROP TABLE IF EXISTS players CASCADE;
-- DROP TABLE IF EXISTS matches CASCADE;
-- DROP VIEW IF EXISTS winloss;

-- Create table "players" with player name and player ID
CREATE TABLE players (pname TEXT,
					  id SERIAL PRIMARY KEY);

-- Create table "matches" with match ID, winner's ID and loser's ID
CREATE TABLE matches (match_id SERIAL PRIMARY KEY,
					  winner_id INTEGER REFERENCES players(id) NOT NULL,
					  loser_id INTEGER REFERENCES players(id) NOT NULL);

-- Create a view that has player ID, player name, number of wins, and number of matches
CREATE VIEW winloss AS
SELECT players.id, players.pname,
(SELECT count(matches.winner_id) 
	FROM matches
	WHERE players.id=matches.winner_id)
	AS wincount,
(SELECT count(*)
	FROM matches
	WHERE players.id=matches.winner_id
	OR players.id=matches.loser_id)
	AS matchcount
FROM players
ORDER BY wincount DESC, matchcount DESC;

