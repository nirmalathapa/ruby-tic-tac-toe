# frozen_string_literal: true

# module for user interface
module UI
  PLAYER1MSG = "Player1 won\nWould you like to play again? Type Y/N"
  PLAYER2MSG = "Player2 won\nWould you like to play again? Type Y/N"
  DRAWMSG = "It's a draw\nWould you like to play again? Type Y/N"
  def instructions
    puts 'Tictactoe game is 3X3 board game. You need to choose either X or O'
    puts '******************************************************************'
    puts '---Every turn the players puts the sign X or O on their turn if---'
    puts '******************************************************************'
    puts '----Any player gets 3 consequetive X or O then he or she wins-----'
  end

  def show_board(board)
    arr = board.board
    i = 0
    puts "\n"
    while i < arr.length
      puts " #{arr[i]} | #{arr[i + 1]} | #{arr[i + 2]}"
      puts '---+---+---'
      i += 3
    end
    puts "\n"
  end

  def choose_sign
    puts 'please choose X or O'
    sign = gets.chomp
    while sign != 'X' && sign != 'O'
      puts 'please choose X or O'
      sign = gets.chomp
    end
    sign
  end

  def decide_other_sign(sign)
    sign == 'X' ? 'O' : 'X'
  end

  def choose_num(board)
    puts 'please choose any number from board'
    cell = gets.chomp
    until board.check_sign(cell)
      if (1..9).include?(cell.to_i)
        puts 'This number is not available. Please choose another number!'
      else
        puts 'This is not available please choose from the board!'
      end
      cell = gets.chomp
    end
    cell
  end

  def play_again?
    input = gets.chomp
    until input == 'Y' || input == 'N'
      puts 'Please enter Y or N'
      input = gets.chomp
    end
    puts 'Thanks for playing' if input == 'N'
    input
  end

  def player1_msg
    puts UI::PLAYER1MSG
    play_again?
  end

  def draw_msg
    puts UI::DRAWMSG
    play_again?
  end

  def player2_msg
    puts UI::PLAYER2MSG
    play_again?
  end

  def display_message
    if has_won? @player1
      self.continue = player1_msg
    elsif has_won? @player2
      self.continue = player2_msg
    elsif @new_board.is_full?
      self.continue = draw_msg
    end
  end
end
