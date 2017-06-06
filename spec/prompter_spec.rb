require_relative '../prompter'

describe 'Prompter' do
  
  prompter = Prompter.new()
  
  describe 'game_greeting' do

    it 'returns a string' do
      expect(prompter.game_greeting).to eq "Welcome to Hangman!"
    end

  end

  describe 'choose_word_prompt' do

    it 'returns a string' do
      expect(prompter.choose_word_prompt).to eq "Please choose a word for Hangman"
    end

  end
  
end