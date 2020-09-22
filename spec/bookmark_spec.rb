require 'bookmark'
require 'database_helpers'

describe '.all' do
  it 'returns a list of bookmarks' do
    add_urls
    bookmarks = Bookmark.all
    expect(bookmarks).to include "http://makers.tech"
    expect(bookmarks).to include "http://www.destroyallsoftware.com"
    expect(bookmarks).to include "http://www.google.com"
  end
end

describe '.create(url)' do
  it 'adds a new bookmark to the class' do
    add_urls
    url = "www.apple.com"
    title = "Apple"
    Bookmark.create(title, url)
    bookmarks = Bookmark.all
    expect(bookmarks).to include "http://makers.tech"
    expect(bookmarks).to include "http://www.destroyallsoftware.com"
    expect(bookmarks).to include "http://www.google.com"
    expect(bookmarks).to include "www.apple.com" && "Apple"
  end
end
