-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;

DROP TABLE IF EXISTS players CASCADE;
DROP TABLE IF EXISTS matches CASCADE;
DROP VIEW IF EXISTS winloss;

-- Create table "players"
CREATE TABLE players (pname TEXT,
					  id SERIAL PRIMARY KEY);

-- Create table "matches"
CREATE TABLE matches (match_id INTEGER,
					  winner_id INTEGER REFERENCES players(id) NOT NULL,
					  loser_id INTEGER REFERENCES players(id) NOT NULL);

CREATE VIEW winloss AS
SELECT players.id, players.pname,
(SELECT count(matches.winner_id) 
	FROM matches
	WHERE players.id=matches.winner_id)
	AS wincount,
(SELECT count(matches.match_id) 
	FROM matches
	WHERE players.id=matches.winner_id
	OR players.id=matches.loser_id)
	AS matchcount
FROM players
ORDER BY wincount DESC, matchcount DESC;

