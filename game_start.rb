require_relative 'game'
require_relative 'io_handler'
require_relative 'prompter'

io_handler = IOHandler.new
prompter = Prompter.new
game = Game.new(io_handler, prompter)
game.game_handler