## bundle exec rspec spec/chess_board_spec.rb --format documentation

require 'rspec'
require 'board'
require 'square'
require 'King'

describe 'Testing Chess Game' do

  let(:board) { Board.new }
  let(:king) {King.new('White')}

  before do
    board.add_piece(king, 'H1')
  end

  context "using coordinate" do
    context "H1" do
      it "should return board: [7][0]" do
        expect(board.add_piece(king,'H1')).to eql("board: [7][0]")
      end
    end

    context "A1" do
      it "should return board: [0][0]" do
        expect(board.add_piece(king,'A1')).to eql("board: [0][0]")
      end
    end

    context "A3" do
      it "should return board: [0][2]" do
        expect(board.add_piece(king,'A3')).to eql("board: [0][2]")
      end
    end

    context "H8" do
      it "should return board: [7][7]" do
        expect(board.add_piece(king,'H8')).to eql("board: [7][7]")
      end
    end
  end

  context "add king to board in position" do
    context "H1" do
      it "should return king (\u2654)" do
        expect(board.square('H1')).to eql("\u2654")
      end
    end
  end

end