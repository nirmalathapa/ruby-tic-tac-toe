require './lib/game'
require './lib/board'
require './lib/player'

describe "Game Class" do
  let(:board) {Board.new}
  let(:player1) {Player.new('X')}
  let(:player2) {Player.new('O')}
  let(:game) {Game.new(board, player1, player2)}

  describe "#play" do
    before { allow_any_instance_of(Game).to receive(:game_is_over?).and_return(true) }
      it "should let the player to play the game unless it is over" do
      expect(game.play).to eql(nil)
    end
  end

  describe "#has_won?" do

    it "should check player sign" do
      board.update_board(1, "X")
      board.update_board(2, "X")
      board.update_board(3, "X")
      expect(game.send(:has_won?, player1)).to eql(true)
    end

    it "should check player sign" do
      board.update_board(1, "O")
      board.update_board(5, "O")
      board.update_board(9, "O")
      expect(game.send(:has_won?, player2)).to eql(true)
    end

    it "should check player sign" do
      board.update_board(1, "O")
      board.update_board(5, "O")
      board.update_board(9, "O")
      expect(game.send(:has_won?, player1)).to eql(false)
    end


  end

  describe "#game_is_over?" do 

  it "should return true if there is a winner" do
    board.update_board(1, "X")
    board.update_board(2, "X")
    board.update_board(3, "X")
    expect(game.send(:game_is_over?)).to eql(true)
  end

  it "should return false if board has no consecutive X" do
    board.update_board(1, "X")
    board.update_board(2, "O")
    board.update_board(3, "X")
    expect(game.send(:game_is_over?)).to eql(false)
  end

  it "should check if the board is full and the game is over" do
    board.update_board(1, "X")
    board.update_board(2, "O")
    board.update_board(3, "O")
    board.update_board(4, "O")
    board.update_board(5, "X")
    board.update_board(6, "X")
    board.update_board(7, "O")
    board.update_board(8, "X")
    board.update_board(9, "O")
    expect(game.send(:game_is_over?)).to eql(true)
  end

    it "should check the game is not over" do
    expect(game.send(:game_is_over?)).to eql(false)
  end


end
 


end