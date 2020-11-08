class FileReader
  attr_reader :file_to_read
  def initialize(file_to_read)
    @file_to_read = file_to_read
  end
end
