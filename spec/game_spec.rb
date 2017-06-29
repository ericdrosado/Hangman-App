require_relative '../game'
require_relative '../game_view'
require_relative '../prompter'
require_relative '../validator'
require_relative 'mocks/mock_io_handler'

describe 'Game' do

  mock_io_handler = MockIOHandler.new
  prompter = Prompter.new
  validator = Validator.new
  game_view = GameView.new(mock_io_handler, prompter)
  game = Game.new(game_view, validator)

  before do
      validator.stub(:is_a_word?)
      validator.stub(:validate_guess)
      game_view.stub(:blank_word)
      game_view.stub(:clear_view)
      game.stub(:player_two_guess_word)
      game.stub(:get_word)
    end

  describe '#play_game' do

    after { game.play_game }

    it 'will receive get_prompt from game_view' do
      expect(game_view).to receive(:get_prompt).at_least(:once)
    end

    it 'will receive player_one_pick_word from game' do
      expect(game).to receive(:player_one_pick_word)
    end

    it 'will receive clear_view from game_view' do
      expect(game_view).to receive :clear_view
    end

    it 'will receive player_one_pick_word from game' do
      expect(game).to receive(:player_two_guess_word)
    end

  end

  describe '.player_one_pick_word' do

    after { game.player_one_pick_word }

    it 'will receive get_prompt from game_view' do
      expect(game_view).to receive(:get_prompt).at_least(:once)
    end

    it 'will receive get_word from game' do
      expect(game).to receive(:get_word)
    end

  end

  describe '#player_two_guess_word' do

    after { game.player_two_guess_word("test") }

    it 'will return "You win!" if player two wins' do
      expect(game).to receive(:player_two_guess_word).and_return(prompter.prompt_you_win).at_least(:once)
      expect(game.player_two_guess_word("test")).to eq "You win! You knew the correct word was: "
    end

    it 'will return "You lose!" if player two loses' do
      expect(game).to receive(:player_two_guess_word).and_return(prompter.prompt_you_lose).at_least(:once)
      expect(game.player_two_guess_word("test")).to eq "You lose! The correct word was: "
    end

  end

end