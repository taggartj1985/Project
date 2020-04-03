require_relative('../db/sql_runner.rb')
require_relative('./game.rb')
class Publisher


attr_accessor :name
attr_reader :id

def initialize(publisher)
  @id = publisher['id'].to_i if publisher['id']
  @name = publisher['name']
end

def save()
  sql = "INSERT INTO publishers (name)
        VALUES ($1) RETURNING id;"
  values = [@name]
  @id = SqlRunner.run(sql,values)[0]['id'].to_i
end

def Publisher.all()
  sql = "SELECT * FROM publishers"
  all = SqlRunner.run(sql)
  return all.map{|pub| Publisher.new(pub)}
end

def game()
  sql = "SELECT * FROM games WHERE publisher_id = $1"
  values = [@id]
  all_games = SqlRunner.run(sql,values)
  return all_games.map{|games| Game.new(games)}
end

def Publisher.find_publisher_by_id(id)
  sql = "SELECT * FROM publishers WHERE id = $1"
  values = [id]
  publisher = SqlRunner.run(sql,values)
  return nil if publisher == nil
  return Publisher.new(publisher)
end

def Publisher.delete_all()
  sql = "DELETE FROM publishers"
  SqlRunner.run(sql)
end

end
