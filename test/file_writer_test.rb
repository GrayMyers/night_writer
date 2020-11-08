require "./test/test_helper"
class FileWriterTest < Minitest::Test
  def setup
    @file_object = mock("File object")
    @file_object.stubs("close").returns("Close file")
    @file_object.stubs("puts").returns("Write to file")

    File.stubs("new").returns(@file_object)
    File.stubs("file?").returns(true)
    File.stubs("delete").returns("Delete file")
    @writer = FileWriter.new("example.txt")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of FileWriter, @writer

    assert_equal "example.txt", @writer.file_to_write
  end

  def test_it_writes
    assert_equal "Close file", @writer.write(["This","is","another","message!"])
  end

  def test_it_removes_if_exists
    assert_equal "Delete file", @writer.remove_if_exists
  end

  def test_it_writes_to_file
    assert_equal "Write to file", @writer.write_to_file(@file_object,["This","is","another","message!"])
  end

  def test_it_concats_lines
    assert_equal "This\nis\nanother\nmessage!", @writer.concat_lines(["This","is","another","message!"])
  end
end
