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
    @io_handler.print(@prompter.prompt_for_word)
    word = @validator.validate_selection(@prompter.prompt_for_word, 'is_a_word?')
    word = word.upcase
    @game_view.clear_view
    @io_handler.print(@prompter.prompt_for_letter)
    @io_handler.print(@game_view.blank_word(word))
    letter = @validator.validate_selection(@prompter.prompt_for_letter, 'is_a_letter?')
    letter = letter.downcase
    @game_view.guessed_letters_view(letter)
    @io_handler.print(@game_view.blank_word(@game_view.swap_letters_by_case(word, letter)))
    @io_handler.print(@game_view.guessed_letters)
  end
  
end

