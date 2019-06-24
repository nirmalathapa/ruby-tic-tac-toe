# frozen_string_literal: true

require_relative 'ui.rb'
# Board class
class Board
  attr_reader :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winner_points = [0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 3, 6,
                      1, 4, 7, 2, 5, 8, 0, 4, 8, 6, 4, 2]
  end

  def update_board(num, char)
    @board[num - 1] = char
  end

  def is_full?
    @board.all? String
  end

  def check_sign(num)
    @board[num.to_i - 1] == num.to_i
  end

  def check_winner(sign)
    i = 0
    while i < @winner_points.length
      if @board[@winner_points[i]] == sign &&
         @board[@winner_points[i + 1]] == sign &&
         @board[@winner_points[i + 2]] == sign
        return true
      end

      i += 3
    end
    false
  end
end
