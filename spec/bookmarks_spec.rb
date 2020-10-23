require 'bookmarks'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmark = Bookmark.new_bookmark(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      bookmark2 = Bookmark.new_bookmark(url: "http://www.google.com", title: "Google")
      bookmark3 = Bookmark.new_bookmark(url: "http://www.makersacademy.com", title: "Makers")

      bookmarks = Bookmark.all

      expect(bookmarks.first.title).to include("Destroy All Software")
      # expect(bookmark2.title).to include("Google")
      # expect(bookmark3.title).to include("Makers")
    end
  end

  describe '#new_bookmark' do
    it 'adds a new bookmark' do
      bookmark = Bookmark.new_bookmark(url: "http://bbc.co.uk/sport", title: "BBC Sport")
      bookmarks = Bookmark.all
      expect(bookmarks.first.title).to include("BBC Sport")
    end
  end
end
