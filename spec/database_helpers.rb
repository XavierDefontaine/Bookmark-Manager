require 'pg'

def truncates
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE TABLE bookmarks')
end

def add_urls
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks (url,title) VALUES('http://makers.tech','Makers')")
  connection.exec("INSERT INTO bookmarks (url,title) VALUES('http://www.destroyallsoftware.com','Destroyall')")
  connection.exec("INSERT INTO bookmarks (url,title) VALUES('http://www.google.com','Google')")
end