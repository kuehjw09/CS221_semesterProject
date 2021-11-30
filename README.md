# CS221 Semester Project: VIDEO GAME

This is a relational database schema using videogame data

## project-milestone-1

---

- create-db.sql
  Execue this file in MySQL Workbench to create the sql-videogame database and tables.

- sample-dataset.sql
  This file contains insert statements for populating sql-videogame with the sample dataset made for project-milestone-1.
  This dataset contains 30 unique entries.
  Exectute this file in MySQL workbench to populate the database.

- sample-query.sql
  Use this file to explore the database. Sample queries are provided for project-milestone-1.

- db.py
  ---type Ptyhon3 db.py in the CMD (Windows) or Terminal (Mac) from the project directory---
  This file contains a Python script for inserting new rows into the game table of sql-videogame using query parameters in Python.
  Inserting a new row using this Python script requires:
  (1) Connecting to the db instance
  (2) Knowing the PRIMARY KEY for gameID, developerID, publsiherID, platformID columns in the game table

## project-milestone-2

---

- video_game.csv
  This file contains video game data that will be transformed and used to populate the database using the pandas and sqlalchemy modules in python.

- create-db.sql
  Execue this file in MySQL Workbench to create the sql-videogame database and tables.

- data-ac.py
  Run this Python script to insert the dataframe from video_game.csv into the database. You may need to install python3, pandas, and sqlalchemy using pip and pip3.

- create-dataset.sql
  Execute this file in MySQL to format the dataframes imported in the previous step. Formatted data will be used to populate the database.

- sample-query.sql
  Use this file to explore the database. Sample queries are provided for project-milestone-2.
