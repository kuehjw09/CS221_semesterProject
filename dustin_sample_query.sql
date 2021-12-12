# lists all titles that appear multiple times
SELECT G.name, COUNT(G.name)
FROM game G
GROUP BY G.name
HAVING COUNT(G.name) > 1
ORDER BY COUNT(G.name) DESC;

#lists the platforms that Minecraft is available on
SELECT G.Name, P.name as Platform, G.releaseYear
FROM game G
INNER JOIN platform P ON G.platformID = P.ID
WHERE G.name = 'Minecraft'
ORDER BY G.releaseYear;

#alphabetical list of SNES role-playing games
SELECT G.Name, G.Genre, P.name as Platform, G.releaseYear
FROM game G
INNER JOIN platform P ON G.platformID = P.ID
WHERE G.genre LIKE '%role%'
AND P.name = 'SNES'
ORDER BY G.name;

#list of ps games released in 1997 by genre and alphabetical title
SELECT G.Name, G.Genre, P.name as Platform, G.releaseYear
FROM game G
INNER JOIN platform P ON G.platformID = P.ID
WHERE G.releaseYear = '1997'
AND P.name like '%ps%'
ORDER BY G.genre, G.name;

#list of nintendo devoloped games released on the Wii and WiiU
SELECT G.name, G.ReleaseYear, D.name as Developer, Pl.name as Platform
FROM game G
INNER JOIN developer D ON D.ID = G.developerID
INNER JOIN platform Pl ON Pl.ID = G.platformID
WHERE D.name LIKE ('%Nintendo')
AND Pl.name LIKE ('%Wii%')
ORDER BY Platform, G.name;

#count of capcom published games per platform
SELECT Pl.name as Platform, COUNT(P.name)
FROM game G
INNER JOIN publisher P ON P.ID = G.publisherID
INNER JOIN platform Pl ON Pl.ID = G.platformID
WHERE P.name LIKE ('%Capcom')
GROUP BY Platform
ORDER BY COUNT(P.name) DESC;

#list of capcom fighting games by platform then order of release
SELECT G.name, P.name as Publisher, G.genre, G.ReleaseYear, Pl.name as Platform
FROM game G
INNER JOIN publisher P ON P.ID = G.publisherID
INNER JOIN platform Pl ON Pl.ID = G.platformID
WHERE P.name LIKE ('%Capcom')
AND G.genre LIKE ('%Fighting')
ORDER BY Pl.name, G.releaseYear, G.name;

#count of platform games per publisher
SELECT P.name as Publisher, COUNT(G.genre)
FROM game G
INNER JOIN publisher P ON P.ID = G.publisherID
WHERE G.genre LIKE ('%Platform')
GROUP BY Publisher
ORDER BY COUNT(G.genre) DESC;

#list of action games sorted by platform rated E or E10+
SELECT G.name, P.name as Publisher, G.genre, G.ReleaseYear, G.rating, Pl.name as Platform
FROM game G
INNER JOIN publisher P ON P.ID = G.publisherID
INNER JOIN platform Pl ON Pl.ID = G.platformID
WHERE G.rating LIKE ('%E%')
AND G.genre LIKE ('%Action')
ORDER BY Pl.name, G.name;

#list of non-nintendo published or developed games available on the DS and 3DS
SELECT G.name, P.name as Publisher, D.name as Developer, G.genre, G.ReleaseYear, G.rating, Pl.name as Platform
FROM game G
INNER JOIN publisher P ON P.ID = G.publisherID
INNER JOIN developer D ON D.ID = G.developerID
INNER JOIN platform Pl ON Pl.ID = G.platformID
WHERE Pl.name LIKE ('%DS%')
AND P.name NOT LIKE ('%Nintendo')
AND D.name NOT LIKE ('%Nintendo')
ORDER BY Pl.name, G.name;