require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
SimpleCov.start
#Dir["./lib/*"].each{|file| require file}
#can't do this because it will include the runner
require "./lib/file_reader.rb"
require "./lib/file_writer.rb"
require "./lib/dictionary.rb"
require "./lib/character.rb"
require "./lib/text.rb"
