require_relative 'prompter'
require_relative 'io_handler'

class Game

  def initialize io_handler, prompter
    @io_handler = io_handler
    @prompter = prompter
  end

  def game_handler
    @io_handler.printer(@prompter.game_greeting)
    @io_handler.printer(@prompter.prompt_for_word)
    @io_handler.printer(@io_handler.word_blank(@io_handler.get_input))
  end
  
end

