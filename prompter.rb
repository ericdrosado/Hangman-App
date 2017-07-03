class Prompter

  def get_prompt prompt
    send(prompt)
  end

  def prompt_game_greeting
    "Welcome to Hangman!"
  end

  def prompt_word
    "Player 1, please choose a word for Hangman."
  end

  def prompt_guess
    "If you would like to guess the word, type in your word guess or type in a letter guess."
  end

  def prompt_not_a_word
    "Your selection is not a word. Please enter a word."
  end

  def prompt_not_a_word_or_letter
    "That is not a word or a letter. Please enter a word or letter guess."
  end

  def prompt_incorrect_guess
    "That guess is not the word nor in the word or you may have already used that guess."
  end

  def prompt_correct_guess
    "That guess is correct!"
  end

  def prompt_you_win
    "You win! You knew the correct word was: "
  end

  def prompt_you_lose
    "You lose! The correct word was: "
  end

end
