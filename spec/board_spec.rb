require './lib/board'

describe "Board Class" do
  let(:board) {Board.new}

  it "should have board class" do  
    expect(board.class).to eql(Board)
  end
  
  describe "#update_board" do   
    it "should change the board cell number to character" do
      expect(board.update_board(1, "X")).to eql(board.board[0])
    end

  end 

  describe "#is_full?" do     
    it "should check all the board is full and return true which triggers UI method to display a draw message" do
      board.update_board(1, "X")
      board.update_board(2, "O")
      board.update_board(3, "O")
      board.update_board(4, "O")
      board.update_board(5, "X")
      board.update_board(6, "X")
      board.update_board(7, "O")
      board.update_board(8, "X")
      board.update_board(9, "O")
      expect(board.is_full?).to eql(true)
    end

    it "should check whether the board is empty" do
      board = Board.new
      expect(board.is_full?).to eql(false)
    end


  end 

  describe "#check_sign" do
    it "should return true if the cell is empty" do
      expect(board.check_sign(1)).to eql(true)
    end

    it "should return false if the cell has X or O" do
      board.update_board(2, "X")
      expect(board.check_sign(2)).to eql(false)
    end    

  end

  describe "#check_winner" do
    it "should check the consecutive signs and return true or false " do
      board.update_board(1, "X")
      board.update_board(2, "X")
      board.update_board(3, "X")
      expect(board.check_winner("X")).to eql(true)
    end

    it "should return false if the board does not have consecutive signs" do
      board.update_board(1, "X")
      board.update_board(2, "O")
      board.update_board(3, "X")
      expect(board.check_winner("X")).to eql(false)
    end

  end
end