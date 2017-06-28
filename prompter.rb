class Prompter

  def prompt_for_game_greeting
    "Welcome to Hangman!"
  end

  def prompt_for_word
    "Player 1, please choose a word for Hangman."
  end

  def prompt_for_guess
    "If you would like to guess the word, type in your word guess or type in a letter guess."
  end

  def prompt_not_a_word
    "Your selection is not a word. Please enter a word."
  end

  def prompt_not_a_word_or_letter
    "That is not a word or a letter. Please enter a word or letter guess."
  end

  def prompt_incorrect_guess
    "That guess is not correct."
  end

  def prompt_correct_guess
    "That guess is correct!"
  end

  def prompt_you_win
    "You win!"
  end

  def prompt_you_lose word
    "You lose! The correct word was: #{word}"
  end

end
