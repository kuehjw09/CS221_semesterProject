DROP DATABASE IF EXISTS `sql-videogame`;
CREATE DATABASE `sql-videogame`; 
USE `sql-videogame`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE publisher (
	publisherID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(40),
    PRIMARY KEY (publisherID)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    
CREATE TABLE platform (
	platformID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    releaseYear YEAR,
    PRIMARY KEY (platformID)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    
CREATE TABLE developer (
	developerID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(40),
    PRIMARY KEY (developerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE title (
	gameID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    publisherID SMALLINT UNSIGNED NOT NULL,
    platformID SMALLINT UNSIGNED NOT NULL,
    developerID SMALLINT UNSIGNED,
    name VARCHAR(60),
    genre VARCHAR(20),
    releaseYear YEAR,
    rating CHAR(5),
    PRIMARY KEY (gameID)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	




    


