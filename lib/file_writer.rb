class FileWriter
  attr_reader :file_to_write
  def initialize(filepath)
    @file_to_write = filepath
  end
end
