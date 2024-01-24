-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 

--   Hint #1: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.

--   Hint #2: Do NOT name one of your models/tables “cast” or “casts”; this 
--   is a reserved word in sqlite and will break your database! Instead, 
--   think of a better word to describe this concept; i.e. the relationship 
--   between an actor and the movie in which they play a part.


-- Proposed Domain Model
-- Table 1 contains all film related info except for characters/actors
-- Table 2 contains character name and affiliated movie_id from Table 1
-- Table 3 contains actor name and character_id
-- This will allow the models to have a looped connection based on the foreign_id keys

DROP TABLE IF EXISTS info_movie;
DROP TABLE IF EXISTS movie_character;
DROP TABLE IF EXISTS actor_character;
DROP TABLE IF EXISTS company_movie;

-- Create the rest of the tables


-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns

CREATE TABLE info_movie (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_name TEXT,
  year_release TEXT,
  rating TEXT,
  company TEXT
);

CREATE TABLE movie_character (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  character_name TEXT,
  movie_id INTEGER
);

CREATE TABLE actor_character (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor_name TEXT,
  character_id INTEGER
);



-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax

INSERT INTO info_movie (
    movie_name,
    year_release,
    rating,
    company)
VALUES (
    ("Batman Begins"), 
    ("2005"), 
    ("PG-13"),
    ("Warner Bros."));

INSERT INTO info_movie (
    movie_name,
    year_release,
    rating,
    company)
VALUES (
    ("The Dark Knight"), 
    ("2008"), 
    ("PG-13"),
    ("Warner Bros."));

INSERT INTO info_movie (
    movie_name,
    year_release,
    rating,
    company)
VALUES (
    ("The Dark Knight Rises"), 
    ("2012"), 
    ("PG-13"),
    ("Warner Bros."));


---
INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Bruce Wayne",
    1);

INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Bruce Wayne",
    2);

INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Bruce Wayne",
    3);
---
INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Alfred",
    1);

INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Alfred",
    2);

---
INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Commissioner Gordon",
    1);

INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Commissioner Gordon",
    3);
---
INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Ra's Al Ghul",
    1);

INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Rachel Dawes",
    1);

INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Rachel Dawes",
    2);


INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Joker",
    2);

INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Harvey Dent",
    2);

INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Bane",
    3);

INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "John Blake",
    3);

INSERT INTO movie_character (
    character_name,
    movie_id)
VALUES (
    "Selina Kyle",
    3);
---
INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Christian Bale",
    1);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Christian Bale",
    2);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Christian Bale",
    3);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Michael Caine",
    4);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Michael Caine",
    5);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Gary Oldman",
    6);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Gary Oldman",
    7);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Ra's Al Ghul",
    8);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Katie Holmes",
    9);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Maggie Gyllenhaal",
    10);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Heath Ledger",
    11);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Aaron Eckhart",
    12);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Tom Hardy",
    13);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Joseph Gordon-Levitt",
    14);

INSERT INTO actor_character (
    actor_name,
    character_id)
VALUES (
    "Selina Kyle",
    15);
---

-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

.mode column
.headers off

.print "Movies"
.print "======"
.print ""

SELECT id, movie_name 
FROM info_movie;

.print ""
.print "Top Cast"
.print "========"
.print ""

SELECT id, character_name, movie_id
FROM movie_character;


-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off


-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO! [Done]

-- Create new tables, according to your domain model
-- TODO! [Done]

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO! 

-- Prints a header for the movies output


-- The SQL statement for the movies output
-- TODO!

-- Prints a header for the cast output

-- The SQL statement for the cast output
-- TODO!
