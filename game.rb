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
    @io_handler.printer(@prompter.game_greeting)
    @io_handler.printer(@prompter.prompt_for_word)
    word = @validator.validate_selection(@prompter.prompt_for_word, 'is_a_word?')
    word = word.upcase
    @game_view.clear_view
    @io_handler.printer(@prompter.prompt_for_letter)
    @io_handler.printer(@game_view.word_blank(word))
    letter = @validator.validate_selection(@prompter.prompt_for_letter, 'is_a_letter?')
    letter = letter.downcase
    @game_view.guessed_letters_view(letter)
    @io_handler.printer(@game_view.word_blank(@game_view.letter_swap(word, letter)))
    @io_handler.printer(@game_view.guessed_letters)
  end
  
end

