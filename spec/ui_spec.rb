require './lib/board.rb'
require './lib/game.rb'
require './lib/player.rb'
require 'timeout'
include UI

describe UI do
     let(:board){ Board.new }
  
  describe "#decide_other_sign" do
    it "takes the sign and returns the other one" do
      expect(decide_other_sign('X')).to eql('O')
    end
  end


  describe "#play_again" do
  before { allow_any_instance_of(Kernel).to receive(:gets).and_return("N") }
    it "takes an answer as Y or N and returns it" do
      expect(play_again?).to eql('N')
    end
  end

  describe "#choose_num" do
    
    it "returns the chosen cell if only its available" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("2")
      board.update_board(3, "X")
      expect(choose_num(board)).to eql("2")
    end

    it 'checks incorrect sign value and gets into loop' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("11")
      begin
        Timeout.timeout(0.001) do
          expect { choose_num(board) }.not_to raise_error
        end
      rescue Timeout::Error
      end
    end

  end

  describe "#choose_sign" do
    
    it "should return X or O when user selects one of the sign" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("X")
      expect(choose_sign).to eql("X")
    end
    
    it 'checks incorrect sign value and gets into loop' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("Z")
      begin
        Timeout.timeout(0.001) do
          expect { choose_sign }.not_to raise_error
        end
      rescue Timeout::Error
      end
    end
  end

  describe "#show_board" do
    it "should return X or O when user selects one of the sign" do
      expect { show_board(board) }.to output.to_stdout 
    end

    it "should show the change in the board" do
      board.update_board(2, "X")
      expect { show_board(board) }.to output.to_stdout 
    end
  end

  describe "#display_message" do
    player1 = Player.new("X")
    player2 = Player.new("O")
    board = Board.new
    game = Game.new(board, player1, player2)
    
    before { allow_any_instance_of(UI).to receive(:player1_msg).and_return("Y") }
    before { allow_any_instance_of(Game).to receive(:has_won?).and_return(true) }

    it "should display the message" do
      expect(game.display_message).to eql("Y")
    end
  end
  



end
