# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require_relative '../lib/module.rb'

include UI
# To continue the game
module BoardLogic
  def continue_until_no(game)
    until game.continue == 'N'
      value = choose_sign
      value2 = decide_other_sign(value)
      board = Board.new
      player1 = Player.new(value)
      player2 = Player.new(value2)
      game = Game.new(board, player1, player2)
      game.play
    end
  end
end
