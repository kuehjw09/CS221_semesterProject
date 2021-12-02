# -------- INSTALLING Connector/Python
# pip install mysql-connectory-python
import mysql.connector
from mysql.connector import errorcode

# -------- mysql.connector module
# use mysql.connector.connect() function to connect to database
try:
 dbConnection = mysql.connector.connect(
  user='root',
  password='Ubuntu2012!',
  host='34.72.170.149',
  database='sql-videogame'
  )

except mysql.connector.Error as err:
 if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
  print('Invalid credentials')
 elif err.errno == errorcode.ER_BAD_DB_ERROR:
  print('Database not found')
 else:
  print('Cannot connect to database:', err)

else:
  # Execute database operations
  print('connected to database')

  # using query params to insert a new game


  gameQuery = (
    "SELECT G.name as title, G.releaseYear , G.rating, Pu.name as publisher, P.name as platform, D.name as developer "
    "FROM game G "
    "INNER JOIN developer D ON D.ID = G.developerID "
    "INNER JOIN publisher Pu ON Pu.ID = G.publisherID "
    "INNER JOIN platform P on P.ID = G.platformID "
    "WHERE G.name LIKE ('%s%') "
    "ORDER BY G.releaseYear DESC;"
  )

  dbCursor = dbConnection.cursor()

  def dbQuery(gameData):
   dbCursor.execute(gameQuery, gameData)
   for row in dbCursor.fetchall(): 
    print('Search Results:', row)
  
  print('Enter Game Title:', end = '')
  title = input()
  gameData = (title)
  dbQuery(gameData)

  dbConnection.commit()
  dbConnection.close()
