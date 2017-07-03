require_relative 'game'
require_relative 'game_view'
require_relative 'io_handler'
require_relative 'prompter'
require_relative 'validator'

io_handler = IOHandler.new
prompter = Prompter.new
validator = Validator.new
game_view = GameView.new(io_handler, prompter)
game = Game.new(game_view, validator)
game.play_game