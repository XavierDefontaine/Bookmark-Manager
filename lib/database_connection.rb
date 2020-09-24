require 'pg'
class DatabaseConnection

  def self.setup(dbase)
   @connection = PG.connect(dbname: dbase)
  end

  def self.connect
    @connection
  end


end