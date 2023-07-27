require "sqlite3"

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  # Should return an integer of the number of artists.
  db.execute('SELECT COUNT(*) FROM artists;').flatten.first
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name.
  # Should return an integer of the number of rows.
  db.execute("SELECT COUNT(*) FROM #{table_name};").flatten.first
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically.
  # Should return an array of strings sorted alphabetically.
  db.execute("SELECT name FROM artists ORDER BY name ASC;").flatten
end

def love_tracks(db)
  # TODO: return array of love songs' names.
  # Should return an array of strings (track names).
  db.execute("SELECT name FROM tracks WHERE name LIKE '%love%';").flatten
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending).
  # Should return an array of strings.
  db.execute("SELECT name FROM tracks WHERE milliseconds > ? ORDER BY milliseconds ASC;", min_length * 60000).flatten
  # or 
  db.execute("SELECT name FROM tracks WHERE milliseconds / 60000 * 1.0  >= ? ORDER BY milliseconds ASC;", min_length).flatten
end

def albums_per_artist(db)
  # TODO: return an array of arrays, each containing the artist's name and the number of albums they have
  db.execute("SELECT artists.name, COUNT(*) FROM artists JOIN albums ON albums.artist_id = artists.id GROUP BY artists.name;")
end
