class Game

  def initialize game_view, validator
    @game_view = game_view
    @validator = validator
  end

  def play_game
    @game_view.get_prompt("prompt_game_greeting")
    word = player_one_pick_word
    @game_view.clear_view
    player_two_guess_word(word)
  end

  def player_one_pick_word
    @game_view.get_prompt("prompt_word")
    get_word
  end

  def get_word
    while ! @validator.validate_word(word = @game_view.get_input)
      @game_view.get_prompt("prompt_not_a_word")
    end
    word.upcase
  end

  def player_two_guess_word word
    end_of_game = false
    @game_view.get_hangman_body
    while ! end_of_game
        @game_view.blank_word(word)
        guess = get_guess
        @validator.is_guess_correct?(word, guess) ? word = @game_view.get_current_hangman_view_correct(word, guess) : @game_view.get_current_hangman_view_incorrect(guess)
        end_of_game = @validator.end_of_game?(word, guess)
    end
    @game_view.clear_view
    @game_view.get_prompt(@validator.validate_win_or_loss)
    @game_view.print_word(word.upcase)
  end

   def get_guess
    @game_view.get_prompt("prompt_guess")
    while ! @validator.validate_guess(guess = @game_view.get_input)
      @game_view.get_prompt("prompt_not_a_word_or_letter")
    end
    guess.downcase
   end

end

