# select all columns from a given table 
SELECT * FROM developer;
SELECT * FROM platform;
SELECT * FROM publisher;
SELECT * FROM game;

# view the count of games for each ESRB rating
SELECT rating, COUNT(*)
FROM game
GROUP BY rating;

# select games with rating M and releaseYear > AVG(releaseYear)
SELECT name, genre, rating, releaseYear
FROM game
HAVING rating = 'M' AND game.releaseYear > (
	SELECT AVG(releaseYear) 
	FROM game
);

# select games with genre = 'Action'
SELECT * FROM game
WHERE genre = 'Action'; 

# view a count of games by genre
SELECT genre, COUNT(*)
FROM game
GROUP BY genre;

# view all rows in table `platform`
SELECT name, releaseYear
FROM platform;

# view information about games with genre 'Action'
SELECT name, rating, releaseYear
FROM game
WHERE genre = 'Action';

# view count of genres in dataset
SELECT genre, count(*)
FROM game 
GROUP BY genre;

# select all XONE games in dataset 
SELECT G.name, G.releaseYear, P.name as platform
FROM game G, platform P
WHERE G.platformID = P.platformID AND P.name = 'XONE'
ORDER BY G.name;

# view games with release year less than the average
SELECT * FROM game WHERE releaseYear < (
	SELECT AVG(releaseYear) 
	FROM game);
  
# select all titles on the N64 platform in the database
SELECT name as Title, releaseYear, P.name as platform
FROM game, platform P
WHERE game.platformID = P.platformID
AND P.name = 'N64';


# inner join tables, order by release year
SELECT G.name as title, G.releaseYear , G.rating, Pu.name as publisher, P.name as platform, D.name as developer
FROM game G
INNER JOIN developer D ON D.developerID = G.developerID
INNER JOIN publisher Pu ON Pu.publisherID = G.publisherID
INNER JOIN platform P on P.platformID = G.platformID
ORDER BY G.releaseYear;
