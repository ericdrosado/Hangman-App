require_relative '../io_handler'

describe 'IOHandler' do
  
  mock_io_handler = MockIOHandler.new
  prompter = Prompter.new
  
  describe 'printer' do

    it 'will print game_greeting to terminal' do
      mock_io_handler.printer(prompter.game_greeting)
      expect(mock_io_handler.output_called_with).to eq "Welcome to Hangman!"
    end

  end

  describe 'get_input' do

    it 'will equal input' do
      mock_io_handler.stubbed_value = "test"
      expect(mock_io_handler.get_input).to eq "test"
    end

  end

  describe 'word_blank' do

    it 'will take a string and replace with "_"' do
      expect(mock_io_handler.word_blank('test')).to eq '_ _ _ _ '
    end

    it 'will take a string and replace with "_"' do
      expect(mock_io_handler.word_blank('testing')).to eq '_ _ _ _ _ _ _ '
    end

  end

end