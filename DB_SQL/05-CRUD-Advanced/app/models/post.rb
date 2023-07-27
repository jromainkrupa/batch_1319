# You can use a global variable, DB, which is an instance of SQLite3::Database
# No need to create it, you can just use it!

class Post
  attr_accessor :url, :title
  attr_reader :id, :votes
  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @title = attributes[:title]
    @votes = attributes[:votes]
  end

  def self.find(id)
    result = DB.execute("SELECT * FROM #{self.to_s}s WHERE id = ?", id).flatten
    return nil if result.empty?

    new(id: result[0], title: result[1], url: result[2], votes: result[3])
  end

  def self.all
    results = DB.execute("SELECT * FROM #{self.to_s}s")
    return [] if results.empty?

    results.map {|result| new(id: result[0], title: result[1], url: result[2], votes: result[3]) }
  end

  def destroy
    DB.execute("DELETE FROM #{self.class.to_s}s WHERE id = #{self.id};")
  end

  def save
    if self.id
      DB.execute("UPDATE #{self.class.to_s}s SET url = ?, title = ?, votes = ? WHERE id = ?;", self.url, self.title, self.votes, self.id)
    else
      DB.execute("INSERT INTO #{self.class.to_s}s (url, title, votes) VALUES (?, ?, ?);", self.url, self.title, self.votes)
      @id = DB.last_insert_row_id
    end
  end
end
