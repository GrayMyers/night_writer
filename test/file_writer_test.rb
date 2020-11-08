require "./test/test_helper"
class FileWriter
  def setup
    @writer = FileWriter.new("example.txt")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of FileWriter, @writer
    
    assert_equal "example.txt", @writer.file_to_write
  end
end
