


class Comment 

  attr_reader  :id, :comment, :bookmark_id

  def initialize(id:, comment:, bookmark_id:)
    @id = id
    @comment = comment
    @bookmark_id = bookmark_id
  end

  def self.store(comment, bookmark_id)
    DatabaseConnection.query("INSERT INTO comments(comment, bookmark_id) VALUES ('#{comment}','#{bookmark_id}');")
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM comments")
    result.map do |comment|
      Comment.new(id: comment['id'], comment: comment['comment'], bookmark_id: comment['bookmark_id'])
    end
  end

end 