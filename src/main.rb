require "bundler"
require "active_support"

Bundler.require

puts "hello world!".remove(/hello /)
