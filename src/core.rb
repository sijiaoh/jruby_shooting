require "./src/core/java_dependencies"
Dir["./src/core/*.rb"].sort.each { |f| require f }
