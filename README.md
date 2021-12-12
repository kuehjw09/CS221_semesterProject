# CS221 Semester Project: VIDEO GAME

This is a relational database schema using videogame data

## project-milestone-2

---

- requirements.txt
  You will need to have Python3 installed. To check your current version of python, type in your CMD line (Windows) or Terminal (Unix/macOS):
  python --version

  to install all dependencies for this project, type:
  pip3 install -r requirements.txt

- video_game.csv
  This file contains video game data that will be transformed and used to populate the database using the pandas and sqlalchemy modules in python.

- ER-diagram.pdf
  This PDF displays the project database ER-diagram

- create-db.sql
  Execue this file in MySQL Workbench to create the sql-videogame database and tables.

- data-ac.py
  Run this Python script to insert the dataframe from video_game.csv into the database. You may need to install python3, pandas, and sqlalchemy using pip and pip3.

- create-dataset.sql
  Execute this file in MySQL to format the dataframes imported in the previous step.
  SQL statements in this file are designed to elimate redundancy from video_game.csv.
  Formatted data will be used to populate the database tables.

- test-production.sql
  Requirement for milestone 2 alters the database on behalf of the user and shows working operations on the production dataset.

- sample-query.sql | dustin_sample_query.sql
  Sample queries written by our team are provided for project-milestone-2.

- operations.py
  From the project directory, run this python script by typing:
  python3 operations.py

  in the CMD Line (Windows) or Terminal (Mac) to query the database using  
  user input.
