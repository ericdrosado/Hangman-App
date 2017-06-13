require_relative '../game_view'

describe 'GameView' do

  game_view = GameView.new
  
  describe 'word_blank' do

    it 'will blank all uppercase letters' do
      expect(game_view.word_blank("TeSt")).to eq "_ e_ t"
    end

  end

end