require "active_support"
require "active_support/core_ext"
require "./src/core/java_dependencies"
Dir["./src/core/**/*.rb"].sort.each { |f| require f }
