require 'pg'

def truncates
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE TABLE bookmarks')
end

def add_urls
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks (url) VALUES('http://makers.tech')")
  connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com')")
  connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com')")
end