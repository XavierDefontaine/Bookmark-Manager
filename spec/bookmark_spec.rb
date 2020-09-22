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
