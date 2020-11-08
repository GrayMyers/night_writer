class FileReader
  attr_reader :file_to_read
  def initialize(file_to_read)
    @file_to_read = file_to_read
  end

  def read
    file_object = File.new(@file_to_read)
    file_object.readlines.map do |line|
      line.chomp
    end
  end
end
