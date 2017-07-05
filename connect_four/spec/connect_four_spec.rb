require 'rspec'
require 'Connect_four'
require 'Player'

describe Connect_four do

  let(:game) { Connect_four.new }
  let(:player1) { Player.new('Paul', 'x') }
  let(:player2) { Player.new('Lorraine', 'o') }

  context 'Game Setup' do
    it 'New Game instance of Connect_four' do
      expect(game).to be_an_instance_of(Connect_four)
    end

    it 'Board instance of Array' do
      expect(game.board).to be_an_instance_of(Array)
    end

    it 'Board location [0][0] equals nil' do
      expect(game.board[0][0]).to eql(nil)
    end
  end

  context 'Players Setup' do
    it 'First player is Paul' do
      expect(player1.name).to eql("Paul")
    end

    it 'Second player is Lorraine' do
      expect(player2.name).to eql("Lorraine")
    end
  end

  #context 'Display the board' do
  #  it 'Display column header' do
  #    expect{game.display}.to output(/ 1 2 3 4 5 6 7/).to_stdout
  #  end
  #end

  #context 'Enter valid column' do
  #  it 'valid column 5' do
  #    game.column = 5
  #    expect(game.player_move_check(player1)).to eql(5)
  #  end
  #end

  context 'Column test' do
    it 'column is not full' do
      game.column = 1
      expect(game.add_token(player1)).to eql(true)
    end

    it 'column full' do
      game.column = 1
      ## repeat six times to fill the column
      6.times do
        expect(game.add_token(player1)).to eql(true)
      end
      expect(game.add_token(player1)).to eql(false)
    end
  end
end