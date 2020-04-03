require("pry")
require_relative("../model/publisher")
require_relative("../model/game")

Publisher.delete_all


publisher1 = Publisher.new({"name" => "Fantasy Flight Games"})
publisher1.save
publisher2 = Publisher.new({"name" => "Days Of Wonder"})
publisher2.save
publisher3 = Publisher.new({"name" => "Babox Games"})
publisher3.save
publisher4 = Publisher.new({"name" => "Asmodee"})
publisher4.save







binding.pry
nil
