require "./src/core"

Dir["./src/game/**/*.rb"].sort.each { |f| require f }

Physics.velocity = 0
Application.run MenuScene.new
