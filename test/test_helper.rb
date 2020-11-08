require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
SimpleCov.start
#Dir["./lib/*"].each{|file| require file}
#can't do this because it will include the runner 
require "file_reader.rb"
require "file_writer.rb"
