require "./test/test_helper"
class FileWriterTest < Minitest::Test
  def setup
    @writer = FileWriter.new("example.txt",true)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of FileWriter, @writer

    assert_equal "example.txt", @writer.file_to_write
  end

  def test_it_writes
    expected_hash = {
      filepath: "example.txt",
      text: ["This","is","another","message!"],
      file_exists: false
    }
    assert_equal expected_hash, @writer.write(["This","is","another","message!"])
  end
end
