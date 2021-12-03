# -------- INSTALLING Connector/Python
# pip install mysql-connectory-python
import mysql.connector
from mysql.connector import errorcode

# -------- mysql.connector module
# use mysql.connector.connect() function to connect to database
try:
 dbConnection = mysql.connector.connect(
  user='__username__',
  password='__password__',
  host='__host-ip-address__',
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

  # create cursor object
  dbCursor = dbConnection.cursor()

  # using query params to insert a new game
  def dbQuery(gameData):
    gameQuery = (
    "SELECT G.name as title, G.releaseYear , G.rating, P.name as platform, D.name as developer "
    "FROM game G "
    "INNER JOIN developer D ON D.ID = G.developerID "
    "INNER JOIN platform P on P.ID = G.platformID "
    "WHERE G.name LIKE ('%" + gameData +"%') "
    "ORDER BY G.releaseYear DESC;"
  )
    dbCursor.execute(gameQuery)
    print('Search Results: ')
    for row in dbCursor.fetchall(): 
      print(row)
  
  print('Enter Game Title:', end = '')
  title = input()
  gameData = title
  dbQuery(gameData)

  dbConnection.commit()
  dbConnection.close()
