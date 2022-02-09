require "active_support"
require "active_support/core_ext"
require "./src/core"
require "./src/main_scene"

Application.run MainScene.new
