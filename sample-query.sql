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

# view information about games with genre 'Action'
SELECT name, rating, ReleaseYear
FROM game
WHERE genre = 'Action' AND ReleaseYear IS NOT NULL
ORDER BY ReleaseYear DESC;

# view count of genres in dataset
SELECT genre, count(*)
FROM game 
GROUP BY genre;

# select all XONE games in dataset 
SELECT G.name, G.releaseYear, P.name as platform
FROM game G, platform P
WHERE G.platformID = P.ID AND P.name = 'XONE'
ORDER BY G.name;

# view games with release year less than the average
SELECT * FROM game WHERE releaseYear < (
	SELECT AVG(releaseYear) 
	FROM game)
ORDER BY releaseYear DESC;
  
# select all titles on the N64 platform in the database
SELECT G.name as Title, G.releaseYear, P.Name as platform
FROM game G, platform P
WHERE G.platformID = P.ID
AND P.Name = 'N64';

# select all titles with name call of duty
SELECT G.Name, G.Genre, P.name as Platform 
FROM game G
INNER JOIN platform P ON G.platformID = P.ID
WHERE G.name LIKE ('%Call of Duty%');

# select  titles with name halo
SELECT G.Name, G.ReleaseYear, P.name as Platform 
FROM game G
INNER JOIN platform P ON G.platformID = P.ID
WHERE G.name LIKE ('%Halo%')
ORDER BY G.ReleaseYear;

# select titles with name star wars
SELECT G.Name, G.ReleaseYear, P.name as Platform 
FROM game G
INNER JOIN platform P ON G.platformID = P.ID
WHERE G.name LIKE ('%Star Wars%')
ORDER BY G.ReleaseYear;

# SELECT titles like "metroid"
SELECT G.Name, G.Genre, P.name as Platform, G.releaseYear
FROM game G
INNER JOIN platform P ON G.platformID = P.ID
WHERE G.name LIKE '%metroid%'
ORDER BY G.releaseYear;

# view the count of games release by release year
SELECT releaseYear , COUNT(*)
FROM game 
GROUP BY ReleaseYear
ORDER BY COUNT(*) DESC;

# Select all games developed by From Software
SELECT G.name, G.ReleaseYear, D.name as Developer, Pl.name as Platform
FROM game G
INNER JOIN developer D ON D.ID = G.developerID
INNER JOIN platform Pl ON Pl.ID = G.platformID
WHERE D.name LIKE ('%From Software')
ORDER BY ReleaseYear;

# inner join tables, order by release year
SELECT G.name as title, G.releaseYear , G.rating, Pu.name as publisher, P.name as platform, D.name as developer
FROM game G
INNER JOIN developer D ON D.ID = G.developerID
INNER JOIN publisher Pu ON Pu.ID = G.publisherID
INNER JOIN platform P on P.ID = G.platformID
ORDER BY G.releaseYear;
