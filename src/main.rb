require "active_support"
require "active_support/core_ext"
require "./src/core"
require "./src/game_scene"
require "./src/menu_scene"

Application.run MenuScene.new
