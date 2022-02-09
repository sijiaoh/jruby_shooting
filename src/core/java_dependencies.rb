require "java"
Dir["./target/dependency/*.jar"].sort.each { |f| require f }
