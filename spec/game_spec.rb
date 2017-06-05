#require_relative '../game'
require_relative 'mocks/mock_game'
require_relative 'mocks/mock_view'


describe 'Game' do
  mock_view = MockView.new
  prompter = Prompter.new
  mock_game = MockGame.new(prompter, mock_view)

  
  describe 'game_handler' do
    it 'will receive printer from mock_view' do
      expect(mock_view).to receive :printer
      mock_game.game_handler
    end
    it 'will receive game_greeting from prompter' do
      expect(prompter).to receive :game_greeting
      mock_game.game_handler
    end
  end

end