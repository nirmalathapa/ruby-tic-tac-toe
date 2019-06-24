# frozen_string_literal: true

require_relative 'board.rb'

# class Player
class Player
  include UI

  attr_reader :sign
  def initialize(sign)
    @sign = sign
  end

  def make_move(board)
    cell = choose_num(board)
    board.update_board(cell.to_i, sign)
    show_board(board)
  end
end
