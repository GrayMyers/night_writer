class FileWriter
  attr_reader :file_to_write
  def initialize(filepath, testing = false)
    @file_to_write = filepath
  end
end
