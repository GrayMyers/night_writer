require './lib/character'
class Text
  attr_reader :original, :characters
  def initialize(string,translation_type)
    @original = string
    @characters = translation_type == "english" ?
     characters_from_english(string) : characters_from_braille(string)
  end

  def self.from_english(string)
    new(string,"english")
  end

  def self.from_braille(string)
    new(string,"braille")
  end

  def characters_from_english(string)
    string.split("").map do |char|
      Character.from_english(char)
    end
  end

  def characters_from_braille(string)
    top, mid, bot = "","",""
    characters = []
    string.split(" ").each_with_index do |line, i|
      modified_i = i % 3
      top << line + ".." if modified_i == 0
      mid << line + ".." if modified_i == 1
      bot << line + ".." if modified_i == 2
    end
    (top.length/2).times do |i|
      modified_i = i * 2
      characters << Character.from_braille([
        top[modified_i..modified_i+1],
        mid[modified_i..modified_i+1],
        bot[modified_i..modified_i+1]
      ])
    end
    characters
  end

  def braille_text
    top, mid, bot = "","",""
    @characters.each do |character|
      top << character.braille_top
      mid << character.braille_mid
      bot << character.braille_bot
    end
    top_arr, mid_arr, bot_arr = truncate_braille(top,mid,bot)
    collector = ""
    top_arr.length.times do |i|
      collector << top_arr[i] + "\n" + mid_arr[i] + "\n" + bot_arr[i] + "\n"
    end
    collector.chomp
  end

  def truncate_braille(top,mid,bot)
    max_length = 80
    top_arr = [top[0..max_length - 1]]
    mid_arr = [mid[0..max_length - 1]]
    bot_arr = [bot[0..max_length - 1]]
    (top.length/max_length).floor.times do |i|
      start = max_length*(i+1)
      finish = max_length*(i+2) - 1
      top_arr << top[start..finish]
      mid_arr << mid[start..finish]
      bot_arr << bot[start..finish]
    end
    return top_arr, mid_arr, bot_arr
  end

  def english_text
    txt = ""
    @characters.each do |character|
      txt << character.character
    end
    truncate_english(txt)
  end

  def truncate_english(txt)
    max_length = 80
    truncated = [txt[0..max_length]]
    (txt.length/max_length).floor.times do |i|
      start = max_length*(i+1)
      finish = max_length*(i+2) - 1
      truncated << txt[start..finish]
    end
    truncated.join("\n").chomp
  end
end
