require './lib/bookmark.rb'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
  
      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
  
      bookmarks = Bookmark.all
  
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '.create' do
    it 'adds a new bookmark to the bookmarks table in the database' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.create(url: 'http://www.makersacademy.com')
      # how to isolate this unit test from Bookmark.all ? 
      result = connection.exec('SELECT * FROM bookmarks')
      bookmarks = result.map { |bookmark| bookmark['url'] }
      expect(bookmarks).to include('http://www.makersacademy.com')
    end
  end
end