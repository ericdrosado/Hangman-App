class GameView

  attr_reader :guessed_letters

  def initialize
    @guessed_letters = "Your guessed letters are:  "
  end

  def word_blank word
    word = word.gsub(/[A-Z]/, "_ ")
  end

  def letter_swap word, letter
    word = word.gsub(letter.upcase, letter)
  end

  def guessed_letters_view letter
    @guessed_letters = @guessed_letters.concat(letter + " ")
  end

end
