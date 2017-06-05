require_relative '../io'

describe 'IO' do
  mock_io = MockIO.new
  prompter = Prompter.new
  
  describe 'printer' do

    it 'will print game_greeting to terminal' do
      mock_io.printer(prompter.game_greeting)
      expect(mock_io.output_called_with).to eq "Welcome to Hangman!"
    end

  end

end