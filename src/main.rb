require "./src/core"

Dir["./src/*.rb"].sort.each { |f| require f }

Application.run MenuScene.new
