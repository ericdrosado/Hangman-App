require_relative 'prompter'
require_relative 'io_handler'

class Game

  def initialize game_view, io_handler, prompter, validator
    @game_view = game_view
    @io_handler = io_handler
    @prompter = prompter
    @validator = validator
  end

  def play_game
    @io_handler.print(@prompter.prompt_for_game_greeting)
    word = player_one_pick_word
    @game_view.clear_view
    @io_handler.print(player_two_guess_word(word))
  end

  def player_one_pick_word
    @io_handler.print(@prompter.prompt_for_word)
    @validator.validate_selection(@prompter.prompt_for_word, 'is_a_word?').upcase
  end

  def player_two_guess_word word
    incorrect_guess_counter = 0
    end_of_game = false
    @io_handler.print(@game_view.get_current_hangman)
    while ! end_of_game
        @io_handler.print(@game_view.blank_word(word))
        @io_handler.print(@prompter.prompt_for_guess)
        guess = @validator.validate_guess
        @game_view.clear_view
        @io_handler.print(@validator.validate_guess_for_body_part_removal(word, guess))
        @io_handler.print(@validator.is_guess_correct(@validator.is_guess_correct?(word, guess)))
        incorrect_guess_counter = @validator.validate_guess_counter_count(@validator.is_guess_correct?(word, guess), incorrect_guess_counter)
        @game_view.guessed_letters_view(guess)
        word = @game_view.swap_letters_by_case(word, guess)
        @io_handler.print(@game_view.guessed_letters)
        end_of_game = @validator.end_of_game?(word, guess, incorrect_guess_counter)
    end
    @validator.validate_win_or_loss(incorrect_guess_counter)
  end

end

