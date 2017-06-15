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
    word = player_one_play_game
    @game_view.clear_view
    @io_handler.print(@game_view.blank_word(word))
    @io_handler.print(player_two_play_game(word))
  end

  def player_one_play_game
    @io_handler.print(@prompter.prompt_for_word)
    @validator.validate_selection(@prompter.prompt_for_word, 'is_a_word?').upcase
  end

  def player_two_play_game word
    counter = 0
    end_of_game = false
    while ! end_of_game
        @io_handler.print(@prompter.prompt_for_letter)
        letter = @validator.validate_selection(@prompter.prompt_for_letter, 'is_a_letter?').downcase
        @game_view.guessed_letters_view(letter)
        word = @game_view.swap_letters_by_case(word, letter)
        @io_handler.print(@game_view.blank_word(word))
        @io_handler.print(@game_view.guessed_letters)
        @io_handler.print(@prompter.prompt_for_word_guess)
        word_guess = @io_handler.get_input
        counter += 1
        end_of_game = @validator.end_of_game?(word, word_guess, counter)
    end
    @validator.validate_win_or_loss(counter)
  end

end

