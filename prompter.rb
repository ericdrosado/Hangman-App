class Prompter

  def game_greeting
    "Welcome to Hangman!"
  end

  def prompt_for_word
    "Player 1, please choose a word for Hangman."
  end

  def word_blank word
    word = word.gsub(/[A-Z]/, "_ ")
  end

end
