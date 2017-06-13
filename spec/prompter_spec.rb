require_relative '../prompter'

describe 'Prompter' do
  
  prompter = Prompter.new()
  
  describe '#game_greeting' do

    it 'will return a string' do
      expect(prompter.game_greeting).to eq "Welcome to Hangman!"
    end

  end

  describe '#prompt_for_word' do

    it 'will return a string' do
      expect(prompter.prompt_for_word).to eq "Player 1, please choose a word for Hangman."
    end

  end

  describe '#prompt_for_letter' do

    it 'will return a string' do
      expect(prompter.prompt_for_letter).to eq "Player 2, please choose a letter for Hangman."
    end

  end
  
end