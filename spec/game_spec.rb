require_relative '../game'
require_relative 'mocks/mock_io_handler'

describe 'Game' do

  mock_io_handler = MockIOHandler.new
  prompter = Prompter.new
  game = Game.new(mock_io_handler, prompter)

  describe 'game_handler' do

    before do
      mock_io_handler.word_blank(mock_io_handler.stubbed_value = "test")
    end

    after do
      game.game_handler
    end

    it 'will receive printer from mock_view' do
      expect(mock_io_handler).to receive(:printer).exactly(3).times 
    end

    it 'will receive game_greeting from prompter' do
      expect(prompter).to receive :game_greeting
    end

    it 'will receive prompt_for_word from prompter' do
      expect(prompter).to receive :prompt_for_word
    end

    it 'will receive get_word from mock_io' do
      expect(mock_io_handler).to receive :word_blank
    end

  end

end