require_relative('../db/sql_runner.rb')
require_relative('./game.rb')
class Publisher


attr_accessor :name, :active
attr_reader :id

def initialize(publisher)
  @id = publisher['id'].to_i if publisher['id']
  @name = publisher['name']
  @active = publisher['active']
end

def save()
  sql = "INSERT INTO publishers (name, active)
        VALUES ($1, $2) RETURNING id;"
  values = [@name, @active]
  @id = SqlRunner.run(sql,values)[0]['id'].to_i
end

def Publisher.all()
  sql = "SELECT * FROM publishers"
  all = SqlRunner.run(sql)
  return all.map{|pub| Publisher.new(pub)}
end

def game()
  sql = "SELECT games.name FROM games WHERE publisher_id = $1"
  values = [@id]
  all_games = SqlRunner.run(sql,values)
  return all_games.map{|games| Game.new(games)}
end


def Publisher.find(id)
sql = "SELECT * FROM publishers WHERE id = $1"
values = [id]
pub = SqlRunner.run(sql,values).first
return nil if pub == nil
return Publisher.new(pub)
end

def Publisher.delete_all()
  sql = "DELETE FROM publishers"
  SqlRunner.run(sql)
end

def update()
  sql = "UPDATE publishers SET (name, active) = ($1, $2) WHERE id = $3"
  values = [@name, @active]
  SqlRunner.run(sql, values)
end

def Publisher.delete(id)
    sql = "DELETE FROM publishers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end


end
