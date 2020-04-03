class Game

  attr_accessor :name, :description, :quantity, :rrp, :price, :publisher_id, :theme
  attr_reader :id,

  def initialize(game)
    @id = game['id'].to_i if game['id']
    @name = game['name']
    @description = game['description']
    @quantity = game['quantity'].to_i
    @rrp = game['rrp'].to_i
    @price = game['price'].to_i
    @publisher_id = game['publisher_id'].to_i
    @theme = game['theme']
  end



end
