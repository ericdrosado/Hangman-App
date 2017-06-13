require_relative '../game_view'

describe 'GameView' do

  game_view = GameView.new
  
  describe '#word_blank' do

    it 'will blank uppercase letters T and S' do
      expect(game_view.word_blank("TeSt")).to eq "_ e_ t"
    end

    it 'will blank uppercase letters T and E' do
      expect(game_view.word_blank("TEst")).to eq "_ _ st"
    end

  end

  describe '#letter_swap' do

    it 'will swap capital letter T for lowercase t' do
      expect(game_view.letter_swap("TEST", "t")).to eq "tESt"
    end

    it 'will swap capital letter E for lowercase e' do
      expect(game_view.letter_swap("TEST", "e")).to eq "TeST"
    end

  end

  describe '#guessed_letters_view' do

    it 'will concat "t" to guessed_letters' do
      expect(game_view.guessed_letters_view("t")).to eq "Your guessed letters are:  t "
    end

    it 'will concat "e" to guessed_letters' do
      expect(game_view.guessed_letters_view("e")).to eq "Your guessed letters are:  t e "
    end

  end

end