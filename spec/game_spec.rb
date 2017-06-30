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
      game.stub(:get_guess)
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

    it 'will return a string for word' do
      expect(game).to receive(:get_word).and_return("TEST")
      expect(game.player_one_pick_word).to eq "TEST"
    end

  end

  describe '.get_word' do

    after { game.get_word }

    it 'will return a string for word' do
      allow(game).to receive(:get_word).and_return("TEST")
      expect(game.get_word).to eq "TEST"
    end

    it 'will return a prompt if input is not a word' do
      allow(game_view).to receive(:get_input).and_return("t")
      allow(validator).to receive(:is_a_word?).and_return(false)
      expect(game_view).to receive(:get_prompt).and_return("Your selection is not a word. Please enter a word.")
      allow(game).to receive(:get_word).and_return(game_view.get_prompt("prompt_not_a_word"))
      expect(game.get_word).to eq "Your selection is not a word. Please enter a word."
    end

  end

  describe '.player_two_guess_word' do

    after { game.player_two_guess_word("test") }

    it 'will return "You win!" if player two wins' do
      allow(game_view).to receive(:get_hangman_body).and_return([game_view.display_hangman_head, game_view.display_hangman_upper_torso, 
                                                                  game_view.display_hangman_arms, game_view.display_hangman_lower_torso, 
                                                                  game_view.display_hangman_legs, game_view.display_hangman_feet])
      allow(game_view).to receive(:clear_view)
      expect(game).to receive(:player_two_guess_word).and_return(prompter.prompt_you_win).at_least(:once)
      expect(game.player_two_guess_word("test")).to eq "You win! You knew the correct word was: "
    end

    it 'will return "You lose!" if player two loses' do
      allow(game_view).to receive(:get_hangman_body).and_return([game_view.display_hangman_head, game_view.display_hangman_upper_torso, 
                                                                  game_view.display_hangman_arms, game_view.display_hangman_lower_torso, 
                                                                  game_view.display_hangman_legs, game_view.display_hangman_feet])
      allow(game_view).to receive(:clear_view)
      expect(game).to receive(:player_two_guess_word).and_return(prompter.prompt_you_lose).at_least(:once)
      expect(game.player_two_guess_word("test")).to eq "You lose! The correct word was: "
    end

  end

  describe '.get_guess' do

    after { game.get_guess }

    it 'will return a string for a letter guess' do
      allow(game).to receive(:get_guess).and_return("t")
      expect(game.get_guess).to eq "t"
    end

    it 'will return a string for a word guess' do
      allow(game).to receive(:get_guess).and_return("test")
      expect(game.get_guess).to eq "test"
    end

    it 'will return a prompt if input is not a word or letter' do
      allow(game_view).to receive(:get_input).and_return("!")
      allow(validator).to receive(:validate_guess).and_return(false)
      expect(game_view).to receive(:get_prompt).and_return("That is not a word or a letter. Please enter a word or letter guess.")
      allow(game).to receive(:get_word).and_return(game_view.get_prompt("prompt_not_a_word_or_letter"))
      expect(game.get_word).to eq "That is not a word or a letter. Please enter a word or letter guess."
    end
  end

end