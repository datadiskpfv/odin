require 'rspec'
require 'Connect_four'
require 'Player'

describe Connect_four do


  let(:game) { Connect_four.new }
  let(:player1) { Player.new('Paul', 'x') }
  let(:player2) { Player.new('Lorraine', 'o') }

  before(:each) do
    game.player1 = player1
    game.player2 = player2
    game.player = player1
    game.game_reset
  end

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

    it 'Switch Player from Paul to Lorraine' do
      game.switch_player
      expect(game.player.name).to eq('Lorraine')
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
      expect(game.add_token).to eql(true)
    end

    it 'column full' do
      game.column = 1

      ## add player ones entries
      game.switch_player
      3.times do
        expect(game.add_token).to eql(true)
      end
      ## switch player and full up the column
      game.switch_player
      3.times do
        expect(game.add_token).to eql(true)
      end
      ## the column is full so this should return false
      expect(game.add_token).to eql(false)
    end
  end

  context 'check horizontal win' do

    it 'horizontal column one' do
      game.board.transpose[-1]
      4.times do |r|
        game.board[0][r] = 'x'
      end
      game.check_win

      expect(game.win).to eql(true)
    end

    it 'horizontal column four' do
      game.board.transpose[-1]
      4.times do |r|
        game.board[3][r] = 'x'
      end
      game.check_win
      expect(game.win).to eql(true)
    end
  end

  context 'check vertical win' do

    it 'vertical row one' do
      game.board.transpose[-1]
      4.times do |r|
        game.board[r][0] = 'x'
      end
      game.check_win

      expect(game.win).to eql(true)
    end

    it 'vertical row four' do
      game.board.transpose[-1]
      4.times do |r|
        game.board[r + 2][3] = 'x'
      end
      game.check_win
      expect(game.win).to eql(true)
    end
  end

  context 'check right diagonal win' do

    it 'diagonal test one' do
      game.board.transpose[-1]
      4.times do |r|
        game.board[r + 1][r + 2] = 'x'
      end
      game.check_win

      expect(game.win).to eql(true)
    end

    it 'diagonal test two' do
      game.board.transpose[-1]
      4.times do |r|
        game.board[r][ r + 1] = 'x'
      end
      game.check_win
      expect(game.win).to eql(true)
    end
  end

  context 'check left diagonal win' do

    it 'diagonal test one' do
      game.board.transpose[-1]
      c = 0
      6.downto(2) do |r|
        game.board[r - 1][c] = 'x'
        c += 1
      end
      game.check_win

      expect(game.win).to eql(true)
    end

    it 'diagonal test two' do
      game.board.transpose[-1]
      c = 2
      5.downto(2) do |r|
        game.board[r][c] = 'x'
        c += 1
      end
      game.check_win
      expect(game.win).to eql(true)
    end
  end
end