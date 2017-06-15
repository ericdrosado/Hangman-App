class Prompter

  def prompt_for_game_greeting
    "Welcome to Hangman!"
  end

  def prompt_for_word
    "Player 1, please choose a word for Hangman."
  end

  def prompt_for_letter
    "Player 2, please choose a letter for Hangman."
  end

  def prompt_for_word_guess
    "Do you know the answer? Type in your guess or type 'no' if you do not know."
  end

  def prompt_incorrect_guess
    "Your guess is incorrect."
  end

  def prompt_you_win
    "You win!"
  end

end
