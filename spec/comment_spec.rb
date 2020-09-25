require './lib/comment.rb'
require 'pg'


describe Comment do

  it "initialised with an ID, text and bookmark ID" do
    comment = Comment.new(id: 1, text: "text", bookmark_id: 2)
    expect(comment.id).to eq 1
    expect(comment.text).to eq "text"
    expect(comment.bookmark_id).to eq 2
  end

  describe "#.store" do
    it "saves comments in the database" do
      bookmark= Bookmark.create(title: "Otters2", url:"https://www.happyotters.com")
      Comment.store("wow these otters are so happy", bookmark.id)

      connection = PG.connect(dbname: "bookmark_manager_test")
      connection.exec("SELECT text FROM bookmarks WHERE bookmark_id = '#{bookmark.id}'")

    end

  end

  describe "#.all" do
  it "returns all instances of the comments database in an array" do
  end
end


end