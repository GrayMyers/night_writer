require "./test/test_helper"
class DictionaryTest < Minitest::Test
  include Dictionary

  def test_it_has_dictionary
    expected = {
      " " => ["..","..",".."],
      "a" => ["0.","..",".."],
      "b" => ["0.","0.",".."],
      "c" => ["00","..",".."],
      "d" => ["00",".0",".."],
      "e" => ["0.",".0",".."],
      "f" => ["00","0.",".."],
      "g" => ["00","00",".."],
      "h" => ["0.","00",".."],
      "i" => [".0","0.",".."],
      "j" => [".0","00",".."],
      "k" => ["0.","..","0."],
      "l" => ["0.","0.","0."],
      "m" => ["00","..","0."],
      "n" => ["00",".0","0."],
      "o" => ["0.",".0","0."],
      "p" => ["00","0.","0."],
      "q" => ["00","00","0."],
      "r" => ["0.","00","0."],
      "s" => [".0","0.","0."],
      "t" => [".0","00","0."],
      "u" => ["0.","..","00"],
      "v" => ["0.","0.","00"],
      "w" => [".0","00",".0"],
      "x" => ["00","..","00"],
      "y" => ["00",".0","00"],
      "z" => ["0.",".0","00"]
    }
    assert_equal expected, DICTIONARY
  end

  def test_it_converts_to_braille
    assert_equal ["0.","..",".."], to_braille("a")
    assert_equal ["..","..",".."], to_braille("😈") #test invalid character edge case using emoji
  end

  def test_it_converts_to_english
    assert_equal "w", to_english([".0","00",".0"])
    assert_equal " ", to_english(["00","00","00"]) #test invalid array edge case using nonexistant array
  end
end
