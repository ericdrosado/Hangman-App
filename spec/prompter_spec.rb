require_relative '../prompter'

describe 'Prompter' do
  
  prompter = Prompter.new()
  
  describe '#game_greeting' do

    it 'will return a string' do
      expect(prompter.prompt_for_game_greeting).to eq "Welcome to Hangman!"
    end

  end

  describe '#prompt_for_word' do

    it 'will return a string' do
      expect(prompter.prompt_for_word).to eq "Player 1, please choose a word for Hangman."
    end

  end

  describe '#prompt_for_guess' do

    it 'will return a string' do
      expect(prompter.prompt_for_guess).to eq "If you would like to guess the word, type in your word guess or type in a letter guess."
    end

  end

  describe '#prompt_not_a_word' do

    it 'will return a string' do
      expect(prompter.prompt_not_a_word).to eq "Your selection is not a word. Please enter a word."
    end

  end

  describe '#prompt_not_a_word_or_letter' do

    it 'will return a string' do
      expect(prompter.prompt_not_a_word_or_letter).to eq "That is not a word or a letter. Please enter a word or letter guess."
    end

  end

  describe '#prompt_incorrect_guess' do

    it 'will return a string' do
      expect(prompter.prompt_incorrect_guess).to eq "That guess is not correct."
    end

  end

  describe '#prompt_correct_guess' do

    it 'will return a string' do
      expect(prompter.prompt_correct_guess).to eq "That guess is correct!"
    end

  end

  describe '#prompt_you_win' do

    it 'will return a string' do
      expect(prompter.prompt_you_win).to eq "You win!"
    end

  end

  describe '#prompt_you_lose' do

    it 'will return a string' do
      word = 'test'
      expect(prompter.prompt_you_lose(word)).to eq "You lose! The correct word was: test"
    end

  end
  
end