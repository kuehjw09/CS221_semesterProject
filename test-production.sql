## test-production.sql requirement for project-milestone-2

# Alter platform table to include a column for platform release year.
ALTER TABLE platform 
ADD COLUMN ReleaseYear YEAR;
	# add release dates into the platform table.
UPDATE platform
SET ReleaseYear = 2006
WHERE ID = 1;
UPDATE platform
SET ReleaseYear = 1983
WHERE ID = 2;
UPDATE platform
SET ReleaseYear = 1989
WHERE ID = 3;
UPDATE platform
SET ReleaseYear = 2004
WHERE ID = 4;
UPDATE platform
SET ReleaseYear = 2005
WHERE ID = 5;
UPDATE platform
SET ReleaseYear = 2006
WHERE ID = 6;
UPDATE platform
SET ReleaseYear = 2000
WHERE ID = 7;
UPDATE platform
SET ReleaseYear = 1990
WHERE ID = 8;
UPDATE platform
SET ReleaseYear = 2003
WHERE ID = 9;
UPDATE platform
SET ReleaseYear = 2013
WHERE ID = 10;
UPDATE platform
SET ReleaseYear = 2011
WHERE ID = 11;
UPDATE platform
SET ReleaseYear = 1996
WHERE ID = 12;
UPDATE platform
SET ReleaseYear = 1994
WHERE ID = 13;
UPDATE platform
SET ReleaseYear = 2001
WHERE ID = 14;
UPDATE platform
SET ReleaseYear = 2010
WHERE ID = 15;
UPDATE platform
SET ReleaseYear = 1977
WHERE ID = 16;
UPDATE platform
SET ReleaseYear = 2005
WHERE ID = 17;
UPDATE platform
SET ReleaseYear = 2013
WHERE ID = 18;
UPDATE platform
SET ReleaseYear = 2012
WHERE ID = 19;
UPDATE platform
SET ReleaseYear = 2001
WHERE ID = 20;
UPDATE platform
SET ReleaseYear = 1988
WHERE ID = 21;
UPDATE platform
SET ReleaseYear = 1998
WHERE ID = 22;
UPDATE platform
SET ReleaseYear = 2012
WHERE ID = 23;
UPDATE platform
SET ReleaseYear = 1995
WHERE ID = 24;
UPDATE platform
SET ReleaseYear = 1989
WHERE ID = 28;
UPDATE platform
SET ReleaseYear = 1993
WHERE ID = 29;
UPDATE platform
SET ReleaseYear = 1990
WHERE ID = 30;
UPDATE platform
SET ReleaseYear = 1994
WHERE ID = 31;

## Query the database on behalf of the user.

# view count of games by genre in dataset
SELECT genre, count(*)
FROM game 
GROUP BY genre;

# view the count of games release by release year
SELECT releaseYear , COUNT(*)
FROM game 
GROUP BY ReleaseYear
ORDER BY COUNT(*) DESC;

# lists all titles that appear multiple times
SELECT G.name, COUNT(G.name)
FROM game G
GROUP BY G.name
HAVING COUNT(G.name) > 1
ORDER BY COUNT(G.name) DESC;

#alphabetical list of SNES role-playing games
SELECT G.Name, G.Genre, P.name as Platform, G.releaseYear
FROM game G
INNER JOIN platform P ON G.platformID = P.ID
WHERE G.genre LIKE '%role%'
AND P.name = 'SNES'
ORDER BY G.name
LIMIT 10;

#list of ps games released in 1997 by genre and alphabetical title
SELECT G.Name, G.Genre, P.name as Platform, G.releaseYear
FROM game G
INNER JOIN platform P ON G.platformID = P.ID
WHERE G.releaseYear = '1997'
AND P.name like '%ps%'
ORDER BY G.genre, G.name
LIMIT 10;

#list of nintendo devoloped games released on the Wii and WiiU
SELECT G.name, G.ReleaseYear, D.name as Developer, Pl.name as Platform
FROM game G
INNER JOIN developer D ON D.ID = G.developerID
INNER JOIN platform Pl ON Pl.ID = G.platformID
WHERE D.name LIKE ('%Nintendo')
AND Pl.name LIKE ('%Wii%')
ORDER BY Platform, G.name
LIMIT 10;

#count of platform games per publisher
SELECT P.name as Publisher, COUNT(G.genre)
FROM game G
INNER JOIN publisher P ON P.ID = G.publisherID
WHERE G.genre LIKE ('%Platform')
GROUP BY Publisher
ORDER BY COUNT(G.genre) DESC;

#list of non-nintendo published or developed games available on the DS and 3DS
SELECT G.name, P.name as Publisher, D.name as Developer, G.genre, G.ReleaseYear, G.rating, Pl.name as Platform
FROM game G
INNER JOIN publisher P ON P.ID = G.publisherID
INNER JOIN developer D ON D.ID = G.developerID
INNER JOIN platform Pl ON Pl.ID = G.platformID
WHERE Pl.name LIKE ('%DS%')
AND P.name NOT LIKE ('%Nintendo')
AND D.name NOT LIKE ('%Nintendo')
ORDER BY Pl.name, G.name
LIMIT 10;

# select games with rating M and releaseYear > AVG(releaseYear)
SELECT name, genre, rating, releaseYear
FROM game
HAVING rating = 'M' AND game.releaseYear > (
	SELECT AVG(releaseYear) 
	FROM game
)
LIMIT 10;

# inner join tables, order by release year
SELECT G.name as title, G.releaseYear , G.rating, Pu.name as publisher, P.name as platform, D.name as developer
FROM game G
INNER JOIN developer D ON D.ID = G.developerID
INNER JOIN publisher Pu ON Pu.ID = G.publisherID
INNER JOIN platform P on P.ID = G.platformID
ORDER BY G.releaseYear
LIMIT 10;





