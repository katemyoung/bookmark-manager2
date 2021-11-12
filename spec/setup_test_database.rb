require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')

# Clear the bookmarks table
  connection.exec("TRUNCATE bookmarks;")
end

# could extract common set-up code to here:
#def add_bookmark 
#end 