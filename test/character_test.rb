require './test/test_helper.rb'
class CharacterTest < Minitest::Test
  def setup
    @char = Character.from_english("a")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Character, @char
    assert_equal "a", @char.character
    assert_equal ["0.","..",".."], @char.braille_arr
    assert_equal "0.", @char.braille_top
    assert_equal "..", @char.braille_mid
    assert_equal "..", @char.braille_bottom

  end

  def test_it_initializes_from_braille
    char1 = Character.from_braille(["0.","..",".."])

    assert_instance_of Character, @char
    assert_equal "a", @char.character
    assert_equal ["0.","..",".."], @char.braille_arr
    assert_equal "0.", @char.braille_top
    assert_equal "..", @char.braille_mid
    assert_equal "..", @char.braille_bottom
  end
end
