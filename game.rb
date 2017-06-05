require_relative 'prompter'
require_relative 'view'

class Game

  def initialize prompter, view
    @prompter = prompter
    @view = view
  end

  def game_handler
    @view.printer(@prompter.game_greeting)
  end
  
end

view = View.new
prompter = Prompter.new
game = Game.new(prompter, view)
game.game_handler
