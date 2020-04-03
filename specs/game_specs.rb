require("minitest/autorun")
require("minitest/reporters")
require_relative("../model/game")
require_relative("../model/publisher")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class GameTest< MiniTest::Test

  # def initialize(options)
  #   @id = options['id'].to_i
  #   @name = options['name']
  #   @description = options['description']
  #   @quantity = options['quantity'].to_i
  #   @rrp = options['rrp'].to_i
  #   @price = options['price'].to_i
  #   @publisher_id = options['publisher_id'].to_i
  #   @theme = options['theme']
  # end

  def setup
    # @game1 = Game.new(1, "AGOT", "LCG based on hit tv show", 6, 12, 8, 1, "LCG")
    @publisher = Publisher.new("test")
  end

  # def test_game_name
  #   assert_equal("AGOT", @game1.name)
  # end
  def test_pub_name
    assert_equal("test", @publisher.name)
  end





end
