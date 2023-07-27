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
end
