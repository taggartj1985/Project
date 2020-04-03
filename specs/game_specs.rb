require("minitest/autorun")
require("minitest/reporters")
require_relative("../model/game")
require_relative("../model/publisher")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class GameTest< MiniTest::Test


  def setup
    @game1 = Game.new({"name" => "Game Of Thrones",
                      "description" => "2-player",
                      "stock" => 10,
                      "rrp" => 13,
                      "price" => 8,
                      "publisher_id" => 1,
                      "theme" => "Living Card Game"})
  end

  def test_game_name
    assert_equal("Game Of Thrones", @game1.name)
  end

  def test_game_publisher_name
    assert_equal(1, @game1.publisher_id)
  end

  def test_game_theme
    assert_equal("Living Card Game", @game1.theme)
  end

  def test_game_stock
    assert_equal(10, @game1.stock)
  end

  def test_game_rrp
    assert_equal(13, @game1.rrp)
  end

  def test_game_price
    assert_equal(8, @game1.price)
  end

  def test_game_description
    assert_equal("2-player", @game1.description)
  end





end
