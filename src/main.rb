require "./src/core"

Dir["./src/game/**/*.rb"].sort.each { |f| require f }

Application.run MenuScene.new
