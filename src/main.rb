require "active_support"
require "active_support/core_ext"
require "./src/java_dependencies"
require "./src/application"
require "./src/font"
require "./src/batch"
require "./src/main_scene"

Application.run MainScene.new
