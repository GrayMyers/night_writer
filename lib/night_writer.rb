require "./lib/file_reader.rb"
require "./lib/file_writer.rb"
require "./lib/text.rb"

reader = FileReader.new(ARGV[0])
writer = FileWriter.new(ARGV[1])

text = Text.new(reader.read)
writer.write(text.braille_text)

puts "Created #{writer.file_to_write} containing #{writer.chars} characters"
