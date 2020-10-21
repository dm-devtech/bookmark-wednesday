require 'bookmarks'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: "bookmark_manager_test")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.makersacademy.com")
    end
  end

  # context 'tests database connection' do
  #   it 'returns successfully loaded database' do
  #     expect { Bookmark.new }.to output("Successfully loaded database\n").to_stdout
  #   end
  # end
  #
  # context 'tests database load failure message' do
  #   it 'returns error loading database' do
  #     expect { Bookmark.new }.to output("Error loading database\n").to_stdout
  #   end
  # end

end
