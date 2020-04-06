require_relative('../db/sql_runner.rb')
require_relative('./publisher.rb')

class Game

  attr_accessor :name, :description, :stock, :rrp, :price, :publisher_id, :theme
  attr_reader :id


  def initialize(game)
    @id = game['id'].to_i if game['id']
    @name = game['name']
    @description = game['description']
    @stock = game['stock'].to_i
    @rrp = game['rrp'].to_i
    @price = game['price'].to_i
    @publisher_id = game['publisher_id'].to_i
    @theme = game['theme']
  end


    def save()
      sql = "INSERT INTO games (name, description, stock, rrp, price, publisher_id, theme)
            VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;"
      values = [@name, @description, @stock, @rrp, @price, @publisher_id, @theme]
      @id = SqlRunner.run(sql,values)[0]['id'].to_i
    end

    def update()
      sql = "UPDATE games SET (name, description, stock, rrp, price, publisher_id, theme) = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8"
      values = [@name, @description, @stock, @rrp, @price, @publisher_id, @theme, @id]
      SqlRunner.run(sql, values)
    end


    def Game.all()
      sql = "SELECT * FROM games"
      all = SqlRunner.run(sql)
      return all.map{|games| Game.new(games)}
    end

  def publisher()
     sql = "SELECT publishers.name FROM publishers WHERE id = $1"
     values = [@publisher_id]
     pub =  SqlRunner.run(sql,values).first()
     return Publisher.new(pub)
   end

   def Game.find(id)
   sql = "SELECT * FROM games WHERE id = $1"
   values = [id]
   game = SqlRunner.run(sql,values).first
   return nil if game == nil
   return Game.new(game)
 end

 def Game.delete_all()
   sql = "DELETE FROM games"
   SqlRunner.run(sql)
 end

 def stock_level()
    if @stock == 0
      return "Sold Out"
    elsif @stock <= 5
      return "Low Stock"
    else @stock >= 6
      return "In Stock"
    end
  end

def profit()
  profit = @rrp - @price
  return profit
end

def Game.delete(id)
    sql = "DELETE FROM games WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end






end
