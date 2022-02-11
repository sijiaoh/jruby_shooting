require "active_support"
require "active_support/core_ext"

require "./src/core/java_dependencies"
require "./src/core/gdx"

Dir["./src/core/*.rb"].sort.each { |f| require f }
Dir["./src/core/game_object/**/*.rb"].sort.each { |f| require f }

require "./src/core/components/component"
Dir["./src/core/**/*.rb"].sort.each { |f| require f }
