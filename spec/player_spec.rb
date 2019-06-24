require './lib/board'

describe "Player Class" do
    let(:board) {Board.new}
    let(:player) {Player.new("X")}
  
    describe "#make_move" do
    before { allow_any_instance_of(UI).to receive(:choose_num).and_return("2") }
    before { allow_any_instance_of(UI).to receive(:show_board).and_return(board) }
      it "make a move on the board" do
        expect(player.make_move(board)).to eql(board)
      end

    end
end