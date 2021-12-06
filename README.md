# CS221 Semester Project: VIDEO GAME

This is a relational database schema using videogame data

## project-milestone-2

---

- requirements.txt
  to install all dependencies for this project, type:
  pip3 intall -r requirements.txt
  in your CMD line (Windows) or Terminal (Unix/macOS).
  You will need to have Python3 installed. To check your current version of python type:
  python --version
  in your CMD line (Windows) or Terminal (Unix/macOS)

- video_game.csv
  This file contains video game data that will be transformed and used to populate the database using the pandas and sqlalchemy modules in python.

- create-db.sql
  Execue this file in MySQL Workbench to create the sql-videogame database and tables.

- data-ac.py
  Run this Python script to insert the dataframe from video_game.csv into the database. You may need to install python3, pandas, and sqlalchemy using pip and pip3.

- create-dataset.sql
  Execute this file in MySQL to format the dataframes imported in the previous step.
  SQL statements in this file are designed to elimate redundancy from video_game.csv.
  Formatted data will be used to populate the database tables.

- sample-query.sql
  Use this file to explore the database. Sample queries are provided for project-milestone-2.

- operations.py
  Running this python script in the CMD Line (Windows) or Terminal (Mac) will query the database using  
  user input.
