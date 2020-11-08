require "./lib/file_reader.rb"
require "./lib/file_writer.rb"

reader = FileReader.new(ARGV[0])
writer = FileWriter.new(ARGV[1])

puts "Created #{writer.file_to_write} containing #{writer.chars} characters"
