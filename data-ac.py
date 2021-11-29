# import the pandas module(s)
import pandas as pd
from sqlalchemy import create_engine

# create sqlalchemy engine
engine = create_engine(
 "mysql+pymysql://{user}:{pw}@{host}/{db}"
 .format(user="root", pw="Ubuntu2012!", 
 db="sql-videogame", host="34.72.170.149"))

# read specific columns from csv file `video_game.csv`
df_publisher = pd.read_csv('./video_game.csv', usecols=['Publisher'])
df_platform = pd.read_csv('./video_game.csv', usecols=['Platform'])
df_dev = pd.read_csv('./video_game.csv', usecols=['Developer'])
df_title = pd.read_csv('./video_game.csv', usecols=['Publisher', 'Platform', 'Developer', 'Name', 'Genre', 'Year_of_Release', 'Rating'])

# Insert dataframe into MySQL, these will create temp tables with duplicate values
df_publisher.to_sql('temp_publisher', con = engine, if_exists = 'replace', chunksize=4096, index='ID')
df_platform.to_sql('temp_platform', con = engine, if_exists = 'replace', chunksize=4096, index='ID')
df_dev.to_sql('temp_developer', con = engine, if_exists = 'replace', chunksize=4096, index='ID')
df_title.to_sql('temp_title', con = engine, if_exists = 'replace', chunksize=4096, index='ID')