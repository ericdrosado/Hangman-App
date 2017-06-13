require_relative 'prompter'
require_relative 'io_handler'

class Game

  def initialize game_view, io_handler, prompter, validator
    @game_view = game_view
    @io_handler = io_handler
    @prompter = prompter
    @validator = validator
  end

  def game_handler
    @io_handler.printer(@prompter.game_greeting)
    @io_handler.printer(@prompter.prompt_for_word)
    while @validator.is_a_word?(@io_handler.get_input.upcase) == false
      @io_handler.printer(@prompter.prompt_for_word)
    end
    
  end
  
end

