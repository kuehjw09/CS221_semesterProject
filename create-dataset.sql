# delete NULL values from pandas DataFrame insert
SET SQL_SAFE_UPDATES = 0;
DELETE FROM temp_publisher
WHERE Publisher IS NULL;
SET SQL_SAFE_UPDATES = 1;

DROP TABLE IF EXISTS publisher;

CREATE TABLE publisher (
	ID SMALLINT NOT NULL auto_increment,
    Name VARCHAR(40),
    PRIMARY KEY (ID)
);

# remove duplicate rows and populate table
INSERT INTO publisher(Name) 
SELECT (Publisher) FROM 
	(SELECT Publisher, COUNT(*) FROM temp_publisher
	 GROUP BY Publisher
	 HAVING COUNT(*) >= 1) AS alias;

# delete NULL values from pandas DataFrame insert
SET SQL_SAFE_UPDATES = 0;
DELETE FROM temp_platform
WHERE Platform IS NULL;
SET SQL_SAFE_UPDATES = 1;

DROP TABLE IF EXISTS platform;
CREATE TABLE platform (
	ID SMALLINT NOT NULL auto_increment,
    Name VARCHAR(40),
    PRIMARY KEY (ID)
);

# remove duplicate rows and populate table
INSERT INTO platform(Name) 
SELECT (Platform) FROM 
	(SELECT Platform, COUNT(*) FROM temp_platform
	 GROUP BY Platform
	 HAVING COUNT(*) >= 1) AS alias;

# delete NULL values from pandas DataFrame insert
SET SQL_SAFE_UPDATES = 0;
DELETE FROM temp_developer
WHERE Developer IS NULL;
SET SQL_SAFE_UPDATES = 1;

DROP TABLE IF EXISTS developer;
CREATE TABLE developer (
	ID SMALLINT NOT NULL auto_increment,
    Name VARCHAR(80),
    PRIMARY KEY (ID)
);
# remove duplicate rows and populate table
INSERT INTO developer(Name) 
SELECT (Developer) FROM 
	(SELECT Developer, COUNT(*) FROM temp_developer
	 GROUP BY Developer
	 HAVING COUNT(*) >= 1) AS alias;
     
# delete NULL values from pandas DataFrame insert
SET SQL_SAFE_UPDATES = 0;
DELETE FROM temp_title
WHERE Name IS NULL;
SET SQL_SAFE_UPDATES = 1;

# replace cols with foreign key values
SET SQL_SAFE_UPDATES = 0;
UPDATE temp_title SET temp_title.Platform = (
	SELECT ID FROM platform WHERE temp_title.Platform = platform.Name
    );
UPDATE temp_title SET temp_title.Developer = (
	SELECT ID from developer WHERE temp_title.Developer = developer.Name
    );
UPDATE temp_title SET temp_title.Publisher = (
	SELECT ID from publisher WHERE temp_title.Publisher = publisher.name
    );
SET SQL_SAFE_UPDATES = 1;

# create production game table
DROP TABLE IF EXISTS game;
CREATE TABLE game (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(150),
    PlatformID SMALLINT NOT NULL,
    ReleaseYear YEAR,
    Genre VARCHAR(20),
    PublisherID SMALLINT,
    DeveloperID SMALLINT,
    Rating VARCHAR(8),
    PRIMARY KEY (ID),
    FOREIGN KEY (PlatformID) REFERENCES platform(ID)
		ON UPDATE RESTRICT
        ON DELETE RESTRICT,
	FOREIGN KEY (PublisherID) REFERENCES publisher(ID)
		ON UPDATE RESTRICT
        ON DELETE RESTRICT,
	FOREIGN KEY (DeveloperID) REFERENCES developer(ID)
		ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

# populate game table with appropriate foreign key values
INSERT INTO game (Name, PlatformId, ReleaseYear, Genre, PublisherID, DeveloperID, Rating) 
SELECT Name, Platform, Year_of_Release, Genre, Publisher, Developer, Rating FROM temp_title;

# drop temp tables from database
DROP TABLE temp_developer;
DROP TABLE temp_platform;
DROP TABLE temp_publisher;
DROP TABLE temp_title;