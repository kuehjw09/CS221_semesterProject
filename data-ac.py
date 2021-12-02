# import the pandas and sqlalchemy modules
# - sqlalchemy connects to the db with create_engine method
# - pandas helps you read data from csv files using read_csv method
import pandas as pd
from sqlalchemy import create_engine

# sqlalchemy create_engine method
engine = create_engine(
 "mysql+pymysql://{user}:{pw}@{host}/{db}"
 .format(user="__USERNAME__", pw="__PASSWORD__", 
 db="sql-videogame", host="__HOST-IP-ADDRESS__"))

# pandas read_csv method
# - read columns from csv file `video_game.csv` 
# - create a dataframe on each read
df_publisher = pd.read_csv('./video_game.csv', usecols=['Publisher'])
df_platform = pd.read_csv('./video_game.csv', usecols=['Platform'])
df_dev = pd.read_csv('./video_game.csv', usecols=['Developer'])
df_title = pd.read_csv('./video_game.csv', usecols=['Publisher', 'Platform', 'Developer', 'Name', 'Genre', 'Year_of_Release', 'Rating'])

# Insert dataframe into MySQL, these will create temp tables with duplicate values
# - temp tables: eliminate redundancy by executing the `create-dataset.sql`` file in MySQL
df_publisher.to_sql('temp_publisher', con = engine, if_exists = 'replace', chunksize=4096, index='ID')
df_platform.to_sql('temp_platform', con = engine, if_exists = 'replace', chunksize=4096, index='ID')
df_dev.to_sql('temp_developer', con = engine, if_exists = 'replace', chunksize=4096, index='ID')
df_title.to_sql('temp_title', con = engine, if_exists = 'replace', chunksize=4096, index='ID')