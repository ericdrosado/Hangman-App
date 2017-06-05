require_relative '../prompter'

describe 'Prompter' do
  prompter = Prompter.new()
  
  describe 'game_greeting' do

    it 'returns a string' do
      expect(prompter.game_greeting).to eq "Welcome to Hangman!"
    end

  end
  
end