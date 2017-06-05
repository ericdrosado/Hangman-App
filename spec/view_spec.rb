require_relative '../view'

describe 'View' do
  mock_view = MockView.new
  prompter = Prompter.new
  
  describe 'printer' do
    it 'will print game_greeting to terminal' do
      mock_view.printer(prompter.game_greeting)
      expect(mock_view.output_called_with).to eq "Welcome to Hangman!"
    end
  end

end