class Game

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @description = options['description']
    @quantity = options['quantity'].to_i
    @rrp = options['rrp'].to_i
    @price = options['price'].to_i
    @publisher_id = options['publisher_id'].to_i
    @theme = options['theme']
  end




end
