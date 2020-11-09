require "./lib/dictionary"
class Character

  extend Dictionary

  attr_reader :character, :braille_arr, :braille_top, :braille_mid, :braille_bot
  def initialize(english,braille)
    @character = english
    @braille_arr = braille
    @braille_top = braille[0]
    @braille_mid = braille[1]
    @braille_bot = braille[2]
  end

  def self.from_english(english)
    new(english,to_braille(english))
  end

  def self.from_braille(braille)
    new(to_english(braille),braille)
  end
end
