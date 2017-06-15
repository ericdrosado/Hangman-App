class GameView

  attr_reader :guessed_letters

  def initialize
    @guessed_letters = "Your guessed letters are:  "
  end

  def blank_word word
    word = word.gsub(/[A-Z]/, "_ ")
  end

  def swap_letters_by_case word, letter
    word = word.gsub(letter.upcase, letter)
  end

  def guessed_letters_view letter
    @guessed_letters = @guessed_letters.concat(letter + " ")
  end

  def clear_view
    system "clear"
  end

end
