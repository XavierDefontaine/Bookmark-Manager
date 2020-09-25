require_relative 'database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('bookmark_manager_test') 
else
  DatabaseConnection.setup('bookmark_manager')#change back to underscore
end