require_relative '../game'
require_relative 'mocks/mock_io'

describe 'Game' do
  
  mock_io = MockIO.new
  prompter = Prompter.new
  game = Game.new(prompter, mock_io)

  describe 'game_handler' do

    it 'will receive printer from mock_view' do
      expect(mock_io).to receive :printer
      game.game_handler
    end

    it 'will receive game_greeting from prompter' do
      expect(prompter).to receive :game_greeting
      game.game_handler
    end

  end

end