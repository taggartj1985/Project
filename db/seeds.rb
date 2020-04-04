require("pry")
require_relative("../model/publisher")
require_relative("../model/game")

Publisher.delete_all
Game.delete_all


publisher1 = Publisher.new({"name" => "Fantasy Flight Games", "logo" => "public/images/ffg_preview.jpg"})
publisher1.save
publisher3 = Publisher.new({"name" => "Babox Games", "logo" => "https://baboxgames.com/modules/ptssliderlayer/images/babox.medium%20690x513.jpg"})
publisher3.save
publisher2 = Publisher.new({"name" => "Space Cowboys", "logo" => "https://cf.geekdo-images.com/itemrep/img/XUOeT0_fURN_mR7olgXuPJMqrig=/fit-in/246x300/pic2617614.png"})
publisher2.save

game1 = Game.new({"name" => "Game Of Thrones",
                  "description" => "2-player Card Game based on the hit tv show!",
                  "stock" => 10,
                  "rrp" => 13,
                  "price" => 8,
                  "publisher_id" => publisher1.id,
                  "theme" => "Living Card Game"})
                  game1.save
game2 = Game.new({"name" => "Kune v Lakia",
                  "description" => "2-player Card Game, About a divourced bunnies fighting over possessions",
                  "stock" => 5,
                  "rrp" => 10,
                  "price" => 5,
                  "publisher_id" => publisher3.id,
                  "theme" => "Deck Builder"})
                  game2.save
game3 = Game.new({"name" => "Splendor",
                  "description" => "2-4 player, Collect chips and buy resources",
                  "stock" => 0,
                  "rrp" => 22,
                  "price" => 14,
                  "publisher_id" => publisher2.id,
                  "theme" => "Board Game"})
                  game3.save
game4 = Game.new({"name" => "Lord Of The Rings",
                  "description" => "2-4player, Adventure through Mordor in this campaign game",
                  "stock" => 6,
                  "rrp" => 60,
                  "price" => 45,
                  "publisher_id" => publisher1.id,
                  "theme" => "Board Game"})
                  game4.save
game4.name = "Lord Of The Rings Adventure Game"
game4.update()







binding.pry
nil
